class IncomingController < ApplicationController
  
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    # puts "INCOMING PARAMS HERE: #{params}"

    # You put the message-splitting and business
    # magic here. 

    subject = params[:Subject]

    Rails.logger.info ">>>>>>>>>>>>>>> #{subject}"

    topics = []

    subject.scan(/\B#([^,\#]+)/).each do |topic|
      topics.push(Topic.find_or_create_by(name: topic.to_s.downcase))
    end

    # Assuming all went well. 
    head 200
  end
end

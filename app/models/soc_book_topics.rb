class SocBookTopics < ActiveRecord::Base
  belongs_to :soc_book
  belongs_to :topic
end

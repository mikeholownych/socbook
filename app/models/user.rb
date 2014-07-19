class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  validates :name, presence: true

  has_many :soc_books
  has_many :likes

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["device.facebook_data"]["extra"]["raw_info"]
        user.email = datap["email"] if user.email.blank?
      end
    end
  end

  def topics
    topics = []
    self.soc_books.each do |soc_book|
      topics.push(soc_book.topics).uniq
    end
    topics
  end
end

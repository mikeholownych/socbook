class SocBook < ActiveRecord::Base
  belongs_to :user
  has_many :soc_book_topics
  has_many :topics, through: :soc_book_topics
  has_many :likes

  validates :url, presence: true, length: { minimum: 1 }
  validates :user, presence: true

end

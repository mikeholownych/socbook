class Topic < ActiveRecord::Base
  validates :name, presence: true

  has_many :soc_book_topics
  has_many :soc_books, through: :soc_book_topics
end

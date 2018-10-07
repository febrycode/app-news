class News < ApplicationRecord
  enum status: [:draft, :deleted, :publish]

  # Association
  has_many :news_topics
  has_many :topics, through: :news_topics
end

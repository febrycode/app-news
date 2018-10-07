class NewsTopic < ApplicationRecord
  # Association
  belongs_to :topic, inverse_of: :news_topics
  belongs_to :news, inverse_of: :news_topics
end

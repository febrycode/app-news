class NewsTopic < ApplicationRecord
  # Association
  belongs_to :topic
  belongs_to :news
end

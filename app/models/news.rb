class News < ApplicationRecord
  enum status: [:draft, :deleted, :publish]
end

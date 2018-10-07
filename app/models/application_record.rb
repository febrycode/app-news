class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def custom_full_messages
    errors.full_messages.join(', ')
  end
end

require 'rails_helper'

RSpec.describe News, type: :model do
  # Association test
  it { should have_many(:news_topics) }
  it { should have_many(:topics).through(:news_topics) }

  # Validation
  it { should validate_presence_of(:name) }
end

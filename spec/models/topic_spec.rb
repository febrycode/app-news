require 'rails_helper'

RSpec.describe Topic, type: :model do
  # Association
  it { should have_many(:news_topics) }
  it { should have_many(:news).through(:news_topics) }

  # Validation
  it { should validate_presence_of(:name) }
end

require 'rails_helper'

RSpec.describe Topic, type: :model do
  # Association
  it { should have_many(:news_topics) }
  it { should have_many(:news).through(:news_topics) }
end

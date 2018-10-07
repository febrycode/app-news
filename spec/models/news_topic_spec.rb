require 'rails_helper'

RSpec.describe NewsTopic, type: :model do
  # Association
  it { should belong_to(:news) }
  it { should belong_to(:topic) }
end

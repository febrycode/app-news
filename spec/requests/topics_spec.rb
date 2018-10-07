require 'rails_helper'

RSpec.describe 'Topic API', type: :request do

  describe 'GET /topics' do
    let!(:topics) { create_list(:topic, 5) }

    before { get '/topics' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns error false message' do
      expect(json['error']).to eql(false)
    end

    it 'returns data topic' do
      expect(json['topics'].length).to eql(5)
    end
  end
end

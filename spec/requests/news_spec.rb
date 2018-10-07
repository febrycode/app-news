require 'rails_helper'

RSpec.describe 'News API', type: :request do

  describe 'GET /news' do
    let!(:news) { create_list(:news, 5) }

    before { get '/news', headers: { 'Accept': 'application/json' } }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns error false message' do
      expect(json['error']).to eql(false)
    end

    it 'returns data topic' do
      expect(json['news'].length).to eql(5)
    end
  end
end
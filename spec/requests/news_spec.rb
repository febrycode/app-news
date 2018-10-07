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

  describe 'POST /news' do

    context 'when valid attributes' do
      let(:valid_attributes) { { name: 'Pilkada 2018', status: 0 } }

      before { post '/topics', params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns error false message' do
        expect(json['error']).to eql(false)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Data has been created successfully/)
      end
    end

    context 'when invalid attributes' do
      before { post '/topics', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error false message' do
        expect(json['error']).to eql(true)
      end

      it 'returns error message' do
        expect(json['message']).to match(/can't be blank/)
      end
    end

  end
end
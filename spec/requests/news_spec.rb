require 'rails_helper'

RSpec.describe 'News API', type: :request do

  describe 'GET /news' do
    let!(:news) { create_list(:news, 5) }

    context 'when filter by news status' do
      before { get '/news', params: { status: 2 }, headers: { 'Accept': 'application/json' } }

      let!(:custom_news) { create(:news, name: 'Pemilu') }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns error false message' do
        expect(json['error']).to eql(false)
      end

      it 'returns data with respective params' do
        expect(json['news'][0]["status"]).to eql("publish")
      end
    end

    context 'when do not filter' do
      before { get '/news', headers: { 'Accept': 'application/json' } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns error false message' do
        expect(json['error']).to eql(false)
      end

      it 'returns data news' do
        expect(json['news'].length).to eql(5)
      end
    end
  end

  describe 'POST /news' do

    context 'when valid attributes' do
      let(:valid_attributes) { { name: 'Pilkada 2018', status: 'draft' } }

      before { post '/news', params: valid_attributes }

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
      before { post '/news', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error false message' do
        expect(json['error']).to eql(true)
      end

      it 'returns error message' do
        expect(json['message']).to include(/can't be blank/)
      end
    end
  end

  describe 'PUT /news/:id' do
    let!(:news) { create_list(:news, 10) }
    let(:news_id) { news.first.id }
    let(:valid_attributes) { { name: 'Pemilu 2019' } }

    before { put "/news/#{news_id}", params: valid_attributes }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns error false message' do
      expect(json['error']).to eql(false)
    end

    it 'returns success message' do
      expect(json['message']).to match(/Data has been updated successfully/)
    end
  end

  describe 'DELETE /news/:id' do
    let!(:news) { create_list(:news, 10) }
    let(:news_id) { news.first.id }

    before { delete "/news/#{news_id}"}

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns error false message' do
      expect(json['error']).to eql(false)
    end

    it 'returns success message' do
      expect(json['message']).to match(/Data has been deleted successfully/)
    end
  end  
end
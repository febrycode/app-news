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

  describe 'POST /topics' do

    context 'when valid attributes' do
      let(:valid_attributes) { { name: 'Sample Event' } }

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

  describe 'PUT /topics/:id' do
    let!(:topics) { create_list(:topic, 10) }
    let(:topic_id) { topics.first.id }
    let(:valid_attributes) { { name: 'Pemilu 2019' } }

    before { put "/topics/#{topic_id}", params: valid_attributes }

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

  describe 'DELETE /topics/:id' do
    let!(:topics) { create_list(:topic, 10) }
    let(:topic_id) { topics.first.id }

    before { delete "/topics/#{topic_id}"}

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

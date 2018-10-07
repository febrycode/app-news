class TopicsController < ApplicationController
  def index
    topics = Topic.all

    render json: { error: false, topics: topics }, status: :ok
  end
end

class TopicsController < ApplicationController
  def index
    topics = Topic.all

    render json: { error: false, topics: topics }, status: :ok
  end

  def create
    topic = Topic.new(topic_params)

    if topic.save
      render json: { error: false, message: 'Data has been created successfully' }, status: :created
    else
      render json: { error: true, message: topic.custom_full_messages }, status: 422
    end
  end

  def update
    topic = Topic.find(params[:id])

    if topic.save
      render json: { error: false, message: 'Data has been updated successfully' }, status: :ok
    else
      render json: { error: true, message: topic.custom_full_messages }, status: 422
    end
  end

  def destroy
    topic = Topic.find(params[:id])

    if topic.destroy
      render json: { error: false, message: 'Data has been deleted successfully' }, status: :ok
    else
      render json: { error: true, message: topic.custom_full_messages }, status: 422
    end
  end

  private

  def topic_params
    params.permit(:name)
  end
end

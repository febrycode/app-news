class TopicsController < ApplicationController
  before_action :set_topic, only: [:update, :destroy]

  def index
    topics = repo.all

    render json: { error: false, topics: topics }, status: 200
  end

  def create
    topic_creation_service = TopicCreationService.new(params).call

    render json: {
      error: topic_creation_service[:error],
      message: topic_creation_service[:message]
    }, status: topic_creation_service[:status]
  end

  def update
    topic_update_service = TopicUpdateService.new(@topic, params, repo).call

    render json: {
      error: topic_update_service[:error],
      message: topic_update_service[:message]
    }, status: topic_update_service[:status]
  end

  def destroy
    topic_delete_service = TopicDeleteService.new(@topic, repo).call

    render json: {
      error: topic_delete_service[:error],
      message: topic_delete_service[:message]
    }, status: topic_delete_service[:status]
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def repo
    @repo ||= TopicRepository.new
  end
end

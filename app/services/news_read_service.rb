class NewsReadService

  attr_reader :status, :topic, :repository

  def initialize(params, repository = NewsRepository.new)
    @status = params[:status]
    @topic = params[:topic]
    @repository = repository
  end

  def call
    news = repository.all

    if is_status_present?
      news = repository.filter_by_status(status, news)
    end

    if is_topic_present?
      news = repository.filter_by_topic(topic, news)
    end

    return news
  end

  private

  def is_status_present?
    status.present?
  end

  def is_topic_present?
    topic.present?
  end
end
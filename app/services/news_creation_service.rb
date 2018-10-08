class NewsCreationService

  attr_reader :name, :status, :topics

  def initialize(params)
    @name = params["name"]
    @status = params["status"]
    @topics = params["topics"]
  end

  def call
    news = News.new(news_attribute)

    News.transaction do
      if news.save
        create_topic_by_news(news)
        @return_value = { error: false, message: 'Data has been created successfully' }
      else
        @return_value = { error: true, message: news.errors.full_messages }
      end
    end

    return @return_value
  end

  private

  def create_topic_by_news(news)
    if is_topic?
      topics.each do |topic|
        begin
          topic = Topic.find(topic["id"])
        rescue ActiveRecord::RecordNotFound => e
          @return_value = { error: true, message: e.message }
          raise ActiveRecord::Rollback
        end
        news.topics << topic
      end
    end
  end

  def news_attribute
    {
      name: name,
      status: status
    }
  end

  def is_topic?
    topics.present?
  end
end
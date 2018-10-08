class NewsRepository
  def all
    News.all
  end

  def filter_by_status(status, news)
    news.where(status: status)
  end

  def filter_by_topic(topic, news)
    news.joins(:topics).where("topics.name = ?", topic)
  end
end
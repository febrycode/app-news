class TopicRepository
  def all
    Topic.all
  end

  def find(id)
    Topic.find(id)
  end

  def new_entity(attrs = nil)
    Topic.new(attrs)
  end

  def save(topic)
    topic.save
  end

  def update(topic, attrs = nil)
    topic.update(attrs)
  end

  def delete(topic)
    topic.destroy
  end
end
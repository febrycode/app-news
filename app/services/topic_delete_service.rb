class TopicDeleteService

  attr_reader :topic, :repository

  def initialize(topic, repository = TopicRepository.new)
    @topic = topic
    @repository = repository
  end

  def call
    if repository.delete(topic)
      return { error: false, message: 'Data has been deleted successfully', status: 200 }
    else
      return { error: true, message: topic.custom_full_messages, status: 422 }
    end
  end
end
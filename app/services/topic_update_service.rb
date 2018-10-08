class TopicUpdateService < TopicService

  attr_reader :topic, :name, :repository

  def initialize(topic, params, repository = TopicRepository.new)
    @topic = topic
    @name = params["name"]
    @repository = repository
  end

  def call
    if repository.update(topic, topic_params)
      return { error: false, message: 'Data has been updated successfully', status: 200 }
    else
      return { error: true, message: topic.custom_full_messages, status: 422 }
    end
  end
end
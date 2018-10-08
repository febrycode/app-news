class TopicCreationService < TopicService

  def call
    topic = repository.new_entity(topic_params)

    if repository.save(topic)
      return { error: false, message: 'Data has been created successfully', status: 201 }
    else
      return { error: true, message: topic.custom_full_messages, status: 422 }
    end
  end
end
class TopicService

  attr_reader :name, :repository

  def initialize(params, repository = TopicRepository.new)
    @name = params["name"]
    @repository = repository
  end

  private

  def topic_params
    {
      name: name
    }
  end
end
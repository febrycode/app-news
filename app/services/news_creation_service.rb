class NewsCreationService

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    news = News.new(news_params)

    News.transaction do
      if news.save
        params["topics"].each do |topic|
          begin
            topic = Topic.find(topic["id"])
            
          rescue ActiveRecord::RecordNotFound => e
            @return_value = { error: true, message: e.message }
            raise ActiveRecord::Rollback
          end

          news.topics << topic
        end

        @return_value = { error: false, message: 'Data has been created successfully' }
      end
    end

    return @return_value
  end

  private

  def news_params
    params.permit(:name, :status)
  end
end
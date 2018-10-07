class NewsCreationService

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    news = News.new(news_params)

    News.transaction do
      if news.save
        if params["topics"].present?
          params["topics"].each do |topic|
            begin
              topic = Topic.find(topic["id"])
              
            rescue ActiveRecord::RecordNotFound => e
              @return_value = { error: true, message: e.message }
              raise ActiveRecord::Rollback
            end

            news.topics << topic
          end
        end

        @return_value = { error: false, message: 'Data has been created successfully' }
      else
        @return_value = { error: true, message: news.errors.full_messages }
      end
    end

    return @return_value
  end

  private

  def news_params
    params.permit(:name, :status)
  end
end
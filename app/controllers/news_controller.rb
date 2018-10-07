class NewsController < ApplicationController
  def index
    news = News.all

    render 'index', locals: { error: false, news: news }, status: :ok
  end

  def create
    news_service = NewsCreationService.new(params).call

    if !news_service[:error]
      render json: { error: news_service[:error], message: news_service[:message] }, status: :created
    else
      render json: { error: news_service[:error], message: news_service[:message] }, status: 422
    end
  end
end

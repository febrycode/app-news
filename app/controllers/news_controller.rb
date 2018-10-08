class NewsController < ApplicationController
  def index
    news_read_service = NewsReadService.new(params).call

    render 'index', locals: { error: false, news: news_read_service }, status: :ok
  end

  def create
    news_service = NewsCreationService.new(params).call

    if !news_service[:error]
      render json: { error: news_service[:error], message: news_service[:message] }, status: :created
    else
      render json: { error: news_service[:error], message: news_service[:message] }, status: 422
    end
  end

  def update
    news = News.find(params[:id])

    if news.update(news_params)
      render json: { error: false, message: 'Data has been updated successfully' }, status: :ok
    else
      render json: { error: true, message: news.custom_full_messages }, status: 422
    end
  end

  def destroy
    news = News.find(params[:id])

    if news.destroy
      render json: { error: false, message: 'Data has been deleted successfully' }, status: :ok
    else
      render json: { error: true, message: news.custom_full_messages }, status: 422
    end
  end

  private

  def news_params
    params.permit(:name, :status)
  end

  def repo
    @repo ||= NewsRepository.new
  end
end

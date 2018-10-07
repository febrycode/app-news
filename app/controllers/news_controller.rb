class NewsController < ApplicationController
  def index
    news = News.all

    render 'index', locals: { error: false, news: news }, status: :ok
  end
end

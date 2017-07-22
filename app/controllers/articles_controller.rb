class ArticlesController < ApplicationController

  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def destroy
    temp = Article.find(params[:id])
    temp.destroy
    redirect_to 'articles#index'#article_path(@article)
    show
  end
end

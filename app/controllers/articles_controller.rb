class ArticlesController < ApplicationController

  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new

    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' Created!"

    redirect_to article_path(@article)
  end

  def destroy
    temp = Article.find(params[:id])
    flash_print = temp.title
    temp.destroy

    flash.notice = "Article '#{flash_print}' Deleted!"

    redirect_to articles_url
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end
end

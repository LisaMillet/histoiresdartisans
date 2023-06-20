class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def civ

  end
end

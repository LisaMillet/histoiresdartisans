class PagesController < ApplicationController
  def home
  end

  def about
  end

  def support
  end

  def news
  end

  def contact
  end

  def directory_artisans
  end

  def blog
  end

  def podcast
  end

  def partnership
  end

  def visite
  end

  def notebooks
    @prospect = Prospect.new
  end
end

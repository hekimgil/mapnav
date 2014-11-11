class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def download
    @title = "Download App"
  end

  def login
    @title = "Log in"
  end

  def about
    @title = "About Us"
  end
end

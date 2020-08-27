class WelcomeController < ApplicationController
  def hom
    redirect_to articles_path if logged_in?
  end
end
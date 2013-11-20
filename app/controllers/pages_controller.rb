class PagesController < ApplicationController
  skip_before_filter :authenticate_user! , :except => [:index]
  def home
  end
end

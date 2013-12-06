class AboutController < ApplicationController

  def index
    @about = Text.all
  end

end

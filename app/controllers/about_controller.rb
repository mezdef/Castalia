class AboutController < ApplicationController

  def index
    @about = Text.all
  end
  
  def mercury_update
    # Update page
    about = Text.first
    about.title = params[:content][:about_title][:value]
    # about.content = params[:content][:value]
    about.save!
    render text: ""
  end

end

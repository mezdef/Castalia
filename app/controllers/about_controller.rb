class AboutController < ApplicationController

  def index
    @about = Text.all
  end

  def update
    @about = Text.first
    if @about.update(params[:text].permit(:document))
      redirect_to about_path
    else
      redirect_to root_path
    end
  end
  
  def mercury_update
    # Update page
    @about = Text.all
    @about.each do |t|
      puts(t.id)
      t.title = params[:content]["about_title_" + "#{t.id}"][:value]
      t.save!
    end
    # about.content = params[:content][:value]
    render text: ""
  end

end

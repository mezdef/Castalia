class AboutController < ApplicationController

  def index
    @about = Text.all
  end

  def create
    @about = Text.find(params[:text_id])
    @asset = @about.assets.create(asset_params)
    redirect_to about_path
    if @asset.save
      flash[:notice] = "Successfully uploaded #{@asset.name}"
    else
      flash[:warning] = "Failed to uploaded file."
    end
  end

  def update
  end
  
  def mercury_update
    # Update page
    @about = Text.all
    @about.each do |t|
      t.title = params[:content]["about_title_" + "#{t.id}"][:value]
      t.save!
    end
    render text: ""
  end

  def destroy
    @text = Text.find(params[:text_id])
    @asset = @text.assets.find(params[:asset_id])
    @assetname = @asset.name
    @asset.destroy
    redirect_to about_path
    flash[:notice] = "Successfully deleted #{@assetname}."
  end

  private
  def asset_params
    params.require(:text).permit(:asset)
  end

end

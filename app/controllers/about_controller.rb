class AboutController < ApplicationController

  def index
    @about = Text.all
  end

  def create
    if params[:text_id]
      @about = Text.find(params[:text_id])
      @asset = @about.assets.create(asset_params)
      redirect_to about_path
      if @asset.save
        flash[:notice] = "Successfully uploaded #{@asset.name}"
      else
        flash[:warning] = "Failed to uploaded file."
      end
    else
      @text = Text.new
      redirect_to about_path
      if @text.save
        flash[:notice] = "Created new about section."
      else
        flash[:warning] = "Failed to create new section."
      end
    end
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
    if params[:text_id]
      @textname = @text.title
      @text.destroy
      redirect_to about_path
      flash[:notice] = "Successfully deleted #{@textname}."
    elsif params [:text_id, :asset_id]
      @asset = @text.assets.find(params[:asset_id])
      @assetname = @asset.name
      @asset.destroy
      redirect_to about_path
      flash[:notice] = "Successfully deleted #{@assetname}."
    end
  end

  private
  def asset_params
    params.require(:text).permit(:asset)
  end

end

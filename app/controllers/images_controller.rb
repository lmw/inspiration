class ImagesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.xml { @images = Image.all :order => 'created_at DESC'}
    end
  end

  def show
    redirect_to large_image_url(params[:id])
  end

  def large
    image = Image.find(params[:id])
    redirect_to image.url
  end

  def add_new
    Image.create_for_new_on_s3
    redirect_to images_url
  end
end

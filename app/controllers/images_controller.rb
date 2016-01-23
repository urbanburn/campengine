class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_filter :camp_id

  def index
    @images = Image.where camp_id: @camp_id
  end

  def show
    image = Image.find_by_id params[:id]
    send_data image.image, disposition: :inline
  end

  def create
    image_io = params[:image]
    Image.create! camp_id: @camp_id, image: image_io.read, user_id: current_user.id
    redirect_to camp_images_path(camp_id: @camp_id)
  end

  def destroy
    Image.find_by_id( params[:id] ).destroy!
    redirect_to camp_images_path(camp_id: @camp_id)
  end

  def camp_id
    @camp_id = params[:camp_id]
  end
end

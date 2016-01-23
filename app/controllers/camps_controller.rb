class CampsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @camps = Camp.all
  end

  def new
    @camp = Camp.new
    @submit_text = 'Create creation'
  end

  def edit
    @camp = Camp.find params[:id]
    @submit_text = 'Update creation'
  end

  def create
    @camp = Camp.new(camp_params)
    @camp.creator = current_user

    if @camp.save
      redirect_to camps_path
    else
      flash.now[:notice] = "Errors: #{@camp.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def update
    @camp = Camp.find(params[:id])
    if @camp.update_attributes camp_params
      redirect_to camp_path(@camp)
    else
      flash.now[:notice] = "Errors: #{@camp.errors.full_messages.join(', ')}"
      render :edit
    end
  end

  # Display a camp and its users
  def show
    @camp = Camp.find(params[:id])
    @users = @camp.users
  end

  # Allow a user to join a particular camp.
  def join
    @camp = Camp.find(params[:id])

    params[:user] ? @user = User.find(params[:user]) : @user = nil

    #
    # Only add a user to the list of associated members if the user isn't
    # in the list. We should add a uniqueness validation to this.
    #

    if !@user
      flash[:notice] = "You need to be logged in to join a Creation."
    elsif @camp.users.include?(@user)
      flash[:notice] = "Nice! You've already joined this Creation."
    else
      flash[:notice] = "Sweet! You just joined this Creation."
      @camp.users << @user
    end
    redirect_to @camp
  end

  private

  def camp_params
    params.require(:camp).permit!
  end

end

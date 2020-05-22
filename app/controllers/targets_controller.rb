class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update]

  def index
    @targets = Target.where(user_id: current_user.id)
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    @target.status = "No Pare"
    if @target.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def target_params
    params.require(:target).permit(:target, :explanation, :limit).merge(user_id: current_user.id)
  end

  def set_target
    @target = Target.find(params[:id])
  end
end
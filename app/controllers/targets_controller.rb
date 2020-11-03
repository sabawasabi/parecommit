class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update]

  def index
    @mytargets = Target.where(user_id: current_user.id).limit(5).order('id DESC')
    @alltargets = Target.all.limit(5).order('id DESC').where.not(user_id: current_user.id)
  end

  def myindex
    @targets = Target.where(user_id: current_user.id)
  end

  def allindex
    @targets = Target.all.where.not(user_id: current_user.id)
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

  def search
    @targets = Target.search(params[:keyword]).where.not(user_id: current_user.id)
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
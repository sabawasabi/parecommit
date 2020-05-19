class TargetsController < ApplicationController

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

  private
  def target_params
    params.require(:target).permit(:target, :explanation, :limit).merge(user_id: current_user.id)
  end
end

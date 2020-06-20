class MatchsController < ApplicationController
  def match_target
    @target = Target.find(params[:target_id])
    @match = Match.new
  end

  def done
    @target = Target.find(params[:target_id])
    @target.status = "Pare"
    @target.save
    Match.create(target_id: params[:target_id], user_id: current_user.id)
  end
end
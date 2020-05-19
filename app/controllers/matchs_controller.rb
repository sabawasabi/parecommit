class MatchsController < ApplicationController
  def index
    @targets = Target.order("created_at ASC")
  end
end
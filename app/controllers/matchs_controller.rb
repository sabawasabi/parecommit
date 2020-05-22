class MatchsController < ApplicationController
  def index
  end

  def new
    @match = Match.new
  end

  def create
    binding.pry
  end

end
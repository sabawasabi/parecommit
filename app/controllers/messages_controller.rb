class MessagesController < ApplicationController
  before_action :set_match

  def index
    binding.pry
    @match   = params[:match_id]
    @message = Message.new
  end

  def create
    binding.pry
    @message = Message.new(message_params)
    if @message.save!
      redirect_to messages_path(@match), notice: 'メッセージが送信されました'
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private
  def message_params
    params.require(:message,).permit(:message,:match_id).merge(user_id: current_user.id)
  end

  def set_match
    # @match = Match.find(params[:match_id])
  end
end

class MessagesController < ApplicationController
before_action :set_match

  def index
    @message = Message.new
    @messages = Message.where(match_id: @match).includes(:user)
  end

  def create
    @message = Message.new(message_params)
    if @message.save!
      redirect_to messages_path(match_id: @match), notice: 'メッセージが送信されました'
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private
  def message_params
    params.require(:message,).permit(:message).merge(match_id: params[:match_id], user_id: current_user.id)
  end

  def set_match
    @match = Match.find(params[:match_id])
  end
end

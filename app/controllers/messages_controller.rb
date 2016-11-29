class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message =Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: "メッセージを投稿しました"
    else
      flash.now[:alert] = "メッセージが投稿できません"
      render action: :index
    end
  end

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end
end

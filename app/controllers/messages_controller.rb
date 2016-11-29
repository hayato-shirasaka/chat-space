class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  def create
    @message =Message.new(message_params)
    if @message.save
      redirect_to group_messages_path, notice: "メッセージを投稿しました"
    else
      flash.now[:alert] = "メッセージが投稿できません"
      render action: :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end

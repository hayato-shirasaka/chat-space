class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def index
    @message = Message.new
    @groups = current_user.groups
    @messages = Message.includes(:user)
  end

  def create
    @message = @group.messages.build(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path}
        format.json
      end
    else
      redirect_to group_messages_path, alert: "メッセージを入力してください"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end

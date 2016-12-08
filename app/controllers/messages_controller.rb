class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @groups = current_user.groups
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path}
        format.json { render json: {
                                    name: current_user.name,
                                    body: @message.body,
                                    created_at: @message.created_at,
                                    }
                                  }
      end
    else
      redirect_to group_messages_path, alert: "メッセージを入力してください"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end

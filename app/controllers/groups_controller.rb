class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(create_params)
    if @group.save
    redirect_to controller: :messages, action: :index
  else
    render action: :new
  end
  end

  private
  def create_params
  params.require(:chat_group).permit(:name, :user_id)
  end

end

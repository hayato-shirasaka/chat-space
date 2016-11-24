class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(create_params)
    if @group.save
    redirect_to controller: :messages, action: :index
  else
    redirect_to controller: :groups, action: :new
  end
  end

  private
  def create_params
  params.require(:chat_group).permit(:name)
  end

end

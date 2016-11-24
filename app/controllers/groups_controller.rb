class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  
  def create
    Group.new(create_params)
    redirect_to controller: :messages, action: :index
  end

  private
  def create_params
  params.require(:chat_groups).permit(:name)
  end

end

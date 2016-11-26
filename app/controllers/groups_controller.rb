class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    # binding.pry
    @group = Group.create(group_params)
    if @group.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path
    else
      render action: :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_id: [])
  end

end

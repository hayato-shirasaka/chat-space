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
    @group= Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    if group.update(group_params)
      redirect_to root_path , notice: "チャットグループが更新されました"

    else
      render action: :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

end

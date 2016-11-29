class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index

  end

  def new
    @group = Group.new
  end

  def create
    # binding.pry
    @group = Group.create(group_params)
    if @group.save
      redirect_to root_path , notice: "チャットグループが作成されました"
    else
      flash.now[:alert] = "チャットグループは作成されていません"
      render action: :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to root_path , notice: "チャットグループが更新されました"
    else
      flash.now[:alert] = "チャットグループが更新されませんでした"
      render action: :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end

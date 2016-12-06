 require 'rails_helper'

describe MessagesController do

  before do
    @user = create(:user)
    @group = create(:group)

    sign_in @user
  end

  after do
    sign_out @user
  end

  describe 'GET #index' do

    it "renders the :index template" do
      get :index, group_id: @group.id
      expect(response).to render_template :index
    end

    it "assigns the requested contact @messages" do
      messages = create_list(:message, 3)
      get :index, group_id: @group.id
      expect(assigns(:messages)).to match(messages)
    end
  end

  describe 'POST #create' do
    it "saves success" do
      get :index, group_id: @group.id
      expect {
        post :create, group_id: @group.id, message: attributes_for(:message)
      }.to change(Message, :count).by(1)
    end

    it "saves failure" do
      get :index, group_id: @group.id
      expect {
        post :create, group_id: @group.id, message: attributes_for(:message, body: "")
      }.not_to change(Message, :count)
    end


    it "redirects to messages#index" do
      post :create, group_id: @group.id, message: attributes_for(:message)
      expect(response).to redirect_to group_messages_path
    end
  end
end

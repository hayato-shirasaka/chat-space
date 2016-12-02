require 'rails_helper'

before do
  @user = create(:user)

  sign_in @user
end

after do
  sign_out @user
end

# describe MessagesController do
#   describe 'GET #index' do
#     it "assigns the requested contact to @message" do
#       message = create(:message)
#       get :index, id: message
#       expext(assigns(:message)).to eq message
#     end

#     it "renders the :index template" do
#     end
#   end


# end

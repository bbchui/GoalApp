require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        post :create, params: { user: { email: "test.com" } }
        expect(response).to redirect_to(new_user_url)
        expect(flash[:errors]).to be_present
      end

      it "validates that password is at least 6 characters long" do
        post :create, params: { user: { email: "test.com", password: "fail" } }
        expect(response).to redirect_to(new_user_url)
        expect(flash[:errors]).to be_present
      end
    end
    context "with valid params" do
      it "redirects user to sign in page" do
        post :create, params: { user: { email: "test.com", password: "password" } }
        expect(response).to redirect_to(users_url)
      end
    end
  end
end

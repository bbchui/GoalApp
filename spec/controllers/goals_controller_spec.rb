require 'rails_helper'
require 'spec_helper'
require 'byebug'

RSpec.describe GoalsController, type: :controller do
  subject(:user) { User.create(email: "test.com", password: "password")}
  describe "POST #create" do

    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        post :create, params: { goal: { title: "Test" } }
        expect(response).to redirect_to(new_goal_url)
        expect(flash[:errors]).to be_present
      end
    end
    context "with valid params" do
      it "validates the presence of the user's email and password" do
        post :create, params: { goal: { title: "Test", user_id: user.id, details: "blah", visibility: "Public", finished: "Ongoing" } }
        expect(response).to redirect_to(goal_url(1))
      end
    end
  end

  describe "PATCH #update" do
    let(:goal1) { Goal.new(title: "Goal", finished: "Ongoing", user_id: 1 ) }
    let(:goal2) { Goal.new(title: "Other Goal", finished: "Completed", user_id: 1 ) }

    # context "Update completed status" do
    #   it 'changes finished status from ongoing to completed' do
    #
    #   end
    #
    #   it 'changes finished status from completed to ongoing' do
    #
    # end
    #
    #

  end
end

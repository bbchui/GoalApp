require 'rails_helper'

RSpec.describe Goal, type: :model do
  let(:user1) { User.create(email: "idk@idk.com", password: "password") }
  let(:user2) { User.create(email: "idk@idk.net", password: "password") }
  subject(:goal) { Goal.new(title: "Finish this Project", user_id: user1.id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:visibility) }
  it { should validate_presence_of(:finished) }
  it { should belong_to(:user) }
  context 'should belong to the proper user' do
    it 'when user is correct' do
      expect(goal.user_id).to eq(user1.id)
    end
    it 'when user is incorrect' do
      expect(goal.user_id).not_to eq(user2.id)
    end
  end
end

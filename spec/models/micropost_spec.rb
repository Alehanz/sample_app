require 'rails_helper'

describe Micropost do
  before(:each) do
    @micropost = create(:micropost) 
  end

  describe 'Validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :content }
    it { should ensure_length_of(:content).
         is_at_most(140) }
  end

  it 'validates micropost' do
    expect(@micropost.content).to eq('Lorem ipsum')
  end

  it 'deletes microposts associated with a user' do
    @user = create(:activated)
    @micropost.user_id = @user.id
    expect{@user.destroy}.to change{Micropost.count}.
      by(-@user.microposts.count)
  end
end

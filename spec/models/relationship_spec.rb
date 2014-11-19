require 'rails_helper'

describe Relationship do
  before(:each) do
    @relationship = Relationship.new(follower_id: 1,
                                     followed_id: 2)
  end

  describe 'Validations' do
    it { should validate_presence_of :follower_id }
    it { should validate_presence_of :followed_id }
  end
end

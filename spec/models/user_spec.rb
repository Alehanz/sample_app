require 'rails_helper'

describe User do
  before(:each) do
    @user = create(:activated)
    @user2 = create(:activated)
    @user3 = create(:activated)
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should ensure_length_of(:name).
         is_at_most(50) }
    it { should validate_presence_of :password }
    it { should ensure_length_of(:password).
         is_at_least(6) }
    it { should validate_presence_of :email }
    it { should validate_confirmation_of :password }
    it { should validate_uniqueness_of :email }
  end

  it 'validates email is not too long' do
    @user.email = "t@a" * 90

    expect(@user).to be_invalid
  end

  it 'validates email has a proper format' do
    valid_addresses = %w[user@example.com USER@foo.COM 
    A_US-ER@foo.bar.org first.last@foo.jp 
    alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address

      expect(@user).to be_valid
    end
  end

  it 'valided email has an improper format' do
    invalid_addresses = %w[user@example,com user_at_foo.org
    user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address

      expect(@user).to be_invalid
    end
  end

  it 'validates email gets saved as lowecase' do
    mixed_case_email = "FoO@exaMPlE.cOm"
    @user.email = mixed_case_email
    @user.save
    expect(mixed_case_email.downcase).to eq(@user.reload.email)
  end

  it 'validates not following a user' do
    relationship = @user.following?(@user)

    expect(relationship).to be_falsey
  end

  it 'validates following a user' do
    @user.follow(@user2)

    relationship = @user.following?(@user2)

    expect(relationship).to be_truthy
  end

  it 'validates unfollowing a user' do
    @user.follow(@user2)
    @user.unfollow(@user2)

    relationship = @user.following?(@user2)

    expect(relationship).to be_falsey
  end

  it 'validates having followers' do
    @user.follow(@user2)

    relationship = @user2.followers.include?(@user)

    expect(relationship).to be true
  end

  it 'validates the feed has the posts from followes user' do
    @user.microposts.each do |post_following|
      expect(@user2.feed).to include?(post_following)
    end
  end

  it 'validates the feed has the posts from self' do
    @user2.microposts.each do |post_self|
      expect(@user2.feed).to include?(post_self)
    end
  end

  it 'validates the feed does not have the posts from unfollowed user' do
    @user3.microposts.each do |post_unfollowed|
      expect(@user3.feed).not_to include?(post_unfollowed)
    end
  end
end

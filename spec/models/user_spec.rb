require 'rails_helper'

describe User do
  before(:each)do
    @user = User.new(name: "Ivan", email: "test@example.com", password: "pass99", password_confirmation: "pass99")
  end

  describe "Validations" do
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
end

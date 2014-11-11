require 'rails_helper'

describe User do
  before(:each)do
    @user = User.new(name: "Ivan", email: "test@example.com", password: "pass99", password_confirmation: "pass99")
  end
  
  it 'validates password is at least 6 symbols' do
    @user.password = @user.password_confirmation = "a" * 5

    expect(@user).to be_invalid
  end

  it 'validates name is not empty' do
    @user.name = ""

    expect(@user).to be_invalid
  end

  it 'validates name is not too long' do
    @user.name = "a" * 51

    expect(@user).to be_invalid
  end

  it 'validates email is not empty' do
    @user.email = ""

    expect(@user).to be_invalid
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

  it 'validates email uniqueness' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save

    expect(duplicate_user).to be_invalid
  end

  it 'validates password is not empty' do
    @user.password = nil

    expect(@user).to be_invalid
  end
end

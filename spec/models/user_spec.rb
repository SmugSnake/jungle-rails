require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it "should be saved" do
      @user = User.create!({
        first_name: 'Evan',
        last_name: 'Kerr',
        email: 'test@test1.com',
        password: 'test',
        password_digest: 'test'
      })
      expect(@user.id).to be_present 
    end
    it "should not be saved due to no password_digest" do
      @user = User.create({
        first_name: 'Evan',
        last_name: 'Kerr',
        email: 'test@test1.com',
        password: nil,
      })
      expect(@user.id).to be_nil 
    end
    it "should not be saved due to first_name" do
      @user = User.create({
        first_name: nil,
        last_name: 'Kerr',
        email: 'test@test1.com',
        password: 'test',
      })
      expect(@user.id).to be_nil 
    end
    it "should not be saved due to last_name" do
      @user = User.create({
        first_name: 'Evan',
        last_name: nil,
        email: 'test@test1.com',
        password: 'test',
      })
      expect(@user.id).to be_nil 
    end
    it "should not be saved due to no email" do
      @user = User.create({
        first_name: 'Evan',
        last_name: 'Kerr',
        email: nil,
        password: 'test',
      })
      expect(@user.id).to be_nil 
    end
    it "should not be saved due to email not meeting minimum length" do
      @user = User.create({
        first_name: 'Evan',
        last_name: 'Kerr',
        email: 'eg',
        password: 'test',
      })
      expect(@user.id).to be_nil 
    end
    it "user2 should not be saved due to duplicate email which is not case sensitive" do
      @user1 = User.create({
        first_name: 'Evan',
        last_name: 'Kerr',
        email: 'test@test1.com',
        password: 'test',
      })
      @user2 = User.create({
        first_name: 'Evan',
        last_name: 'Kerr',
        email: 'test@test1.COM',
        password: 'test',
      })
      expect(@user2.id).to be_nil 
    end
  end
  describe '.authenticate_with_credentials' do
    it "should return a user" do
      @user = User.create({
        first_name: 'Evan',
        last_name: 'Kerr',
        email: 'test@test1.com',
        password: 'test'
      })
      user = User.authenticate_with_credentials({:email => 'test@test1.com', :password => 'test'})
      expect(user).to be_present
    end
    it "should not return a user" do
      @user = User.create({
        first_name: 'Evan',
        last_name: 'Kerr',
        email: 'test@test1.com',
        password: 'test'
      })
      user = User.authenticate_with_credentials({:email => 'test@test10.com', :password => 'test'})
      expect(user).to be_nil
    end
    it "should return a user despite extra spaces at beginning and different cases" do
      @user = User.create({
        first_name: 'Evan',
        last_name: 'Kerr',
        email: 'test@test1.com',
        password: 'test'
      })
      user = User.authenticate_with_credentials({:email => '  test@Test1.COm', :password => 'test'})
      expect(user).to be_present
    end
  end

end

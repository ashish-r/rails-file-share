require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User model validations' do
    let (:valid_params) { {
      user_name: 'bond007',
      full_name: 'James Bond',
      email: 'james@bond.com',
      password: 'validPwd123'
    } }
    it 'user_name should not be empty' do
      user = User.new(valid_params.merge({user_name: ''}))
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:user_name].any?).to be true
    end
    it 'user_name should not be of length more than 15' do
      user = User.new(valid_params.merge({user_name: 'charcount123456789'}))
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:user_name].any?).to be true
    end
    it 'user_name should be unique' do
      user = User.new(valid_params.merge({user_name: 'new_user'}))
      is_user_saved = user.save
      user_dup = User.new(valid_params.merge({user_name: 'new_user'}))
      is_user_dup_saved = user_dup.save
      expect(is_user_saved).to be true 
      expect(user.errors[:user_name].any?).to be false
      expect(is_user_dup_saved).to be false 
      expect(user_dup.errors[:user_name].any?).to be true
    end
    it 'full_name should not be empty' do
      user = User.new(valid_params.merge({full_name: ''}))
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:full_name].any?).to be true
    end
    it 'email should not be empty' do
      user = User.new(valid_params.merge({email: ''}))
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:email].any?).to be true
    end
    it 'email should not be invalid' do
      user = User.new(valid_params.merge({email: 'invalid_email'}))
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:email].any?).to be true
    end
    it 'password should be minimum 8 and maximum 15 chacters long with uppercase, lowercase and numbers' do
      user = User.new(valid_params.merge({password: 'lEss1'}))
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:password].any?).to be true
      user = User.new(valid_params.merge({password: 'moreThan15Characters'}))
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:password].any?).to be true
      user = User.new(valid_params.merge({password: 'withoutupper1'}))
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:password].any?).to be true
      user = User.new(valid_params.merge({password: 'WITHOUTLOWER1'}))
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:password].any?).to be true
      user = User.new(valid_params.merge({password: 'withoutNum'}))
      is_saved = user.save
      expect(is_saved).to be false 
      expect(user.errors[:password].any?).to be true
    end
    it 'should save with correct params' do
      user = User.new(valid_params)
      is_user_saved = user.save
      expect(is_user_saved).to be true 
      expect(user.errors[:user_name].any?).to be false
    end
  end
end

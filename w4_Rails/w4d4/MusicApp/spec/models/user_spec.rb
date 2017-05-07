require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe User do
    subject(:user) do
      FactoryGirl.build(:user,
        email: 'jane@example.com',
        password: 'password')
    end

    it { should validate_presence_of (:email) }
    it { should validate_uniqueness_of (:email) }
    it { should validate_presence_of (:session_token) }
    it { should validate_presence_of (:password_digest) }
    it { should validate_length_of (:password).is_at_least(6).on(:create) }
  end

  describe 'User#is_password?' do
    it "verifies the passowrd is correct" do
      expect(user.is_password?("password")).to be true
    end
  end

  describe 'User#reset_session_token' do
    it 'assigns a new session_token to the user' do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_session_token)
    end
  end

  describe 'User::find_by_credentials' do
    it 'returns user'
    expect(User.find_by_credentials('jane@example.com', 'password')).to eq(user)
  end
end

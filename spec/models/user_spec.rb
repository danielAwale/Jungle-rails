require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do 
    it 'must be a unique email' do
      @user1 = User.create(
        :first_name => 'Dan',
        :last_name => 'Awa',
        :email => 'dan@gmail.com',
        :password => '123412341234',
        :password_confirmation => '123412341234'
      )
      @user2 = User.create(
        :first_name => 'Dan',
        :last_name => 'Aw',
        :email => 'DAn@gmail.com',
        :password => '12345678',
        :password_confirmation => '12345678'
      )
      expect(@user2).to_not be_valid
    end

    it 'must match the password in both fields' do
      @user = User.new(
        :first_name => 'Daniel',
        :last_name => 'Awale',
        :email => 'dan@gmail.com',
        :password => '123412341234',
        :password_confirmation => '432143214321'
      )
      expect(@user).to_not be_valid
    end

    it 'should meet the minimum length of password requirement' do
      @user = User.new(
        :first_name => 'Daniel',
        :last_name => 'Awale',
        :email => 'dan@gmail.com',
        :password => '1',
        :password_confirmation => '1'
      )
      expect(@user).to_not be_valid
    end

    describe '.authenticate_with_credentials' do
      it 'returns an instance of the user' do
        @user1 = User.create(
          :first_name => 'Daniel',
          :last_name => 'Awale',
          :email => 'dan@gmail.com',
          :password => '123412341234',
          :password_confirmation => '123412341234'
        )
        @user1 = User.authenticate_with_credentials('dan@gmail.com', '123412341234')
        expect(@user1).to be_an_instance_of(User)
      end
    end

  end
end

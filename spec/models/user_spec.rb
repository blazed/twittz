require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'assosciation' do
    it { should have_one(:profile).dependent(:destroy) }
    it { should have_many(:relationships).with_foreign_key(:follower_id).dependent(:destroy) }
    it { should have_many(:followed_profiles).through(:relationships).source(:followed) }
  end

  describe 'validation' do
    let(:user) { Fabricate(:user) }

    describe 'of handle' do
      it 'requires presence' do
        user.handle = nil
        expect(user.save).to be false
      end

      it 'requires downcase' do
        user = Fabricate.build(:user, handle: "UserNamE")
        user.save
        expect(user.handle_lower).to eq("username")
      end

      it 'requires uniqueness' do
        user2 = Fabricate.build(:user)
        user2.save
        user.handle = user2.handle
        expect(user).not_to be_valid
      end

      it 'strips whitespaces' do
        user = Fabricate.build(:user, handle: '     myusername    ')
        user.save
        expect(user.handle).to eq('myusername')
      end

      it 'downcases username_lower' do
        user = Fabricate.build(:user, handle: '   MyUSERNAME     ')
        user.save
        expect(user.handle_lower).to eq('myusername')
      end

      it 'should be atleast 3 chars' do
        user = Fabricate(:user)
        user.handle = 'aa'
        expect(user.save).to be false
      end

      it 'can be 30 characters long' do
        user.handle = 'a' * 30
        expect(user).to be_valid
      end

      it 'can not be 31 characters long' do
        user.handle = 'a' * 31
        expect(user).to be_invalid
      end
    end

    describe 'of email' do
      it 'requres email address' do
        user.email = nil
        expect(user).not_to be_valid
      end

      it 'requires a unique email address' do
        user2 = Fabricate(:user)
        user.email = user2.email
        expect(user.save).to be false
      end

      it 'requires a valid email address' do
        user.email = "email@email"
        expect(user).to be_invalid
      end

      it 'rejects mail@mail@example.com' do
        user.email = 'mail@mail@example.com'
        expect(user).to be_invalid
      end

      it 'downcases email' do
        user = Fabricate(:user, email: 'MAIL@ExaMPLE.com')
        user.save
        expect(user.email).to eq('mail@example.com')
      end

      it 'strips whitespaces' do
        user = Fabricate(:user, email: '   mail@example.com     ')
        user.save
        expect(user.email).to eq('mail@example.com')
      end
    end
  end
end

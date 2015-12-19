require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'assosciation' do
    it { should belong_to :user}
    it { should have_many(:posts).dependent(:destroy) }
    it { should have_many(:followers).with_foreign_key(:followed_id).class_name('Relationship').dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'validation' do
    describe 'of name' do
      it 'can be 32 characters long' do
        profile = Fabricate.build(:profile, name: 'S'*32)
        expect(profile).to be_valid
      end

      it 'cannot be 33 characters' do
        profile = Fabricate.build(:profile, name: 'S'*33)
        expect(profile).to be_invalid
      end
    end

    describe 'of location' do
      it 'can be 32 characters long' do
        profile = Fabricate.build(:profile, location: 'S'*32)
        expect(profile).to be_valid
      end

      it 'cannot be 33 characters' do
        profile = Fabricate.build(:profile, location: 'S'*33)
        expect(profile).to be_invalid
      end
    end

    describe 'of bio' do
      it 'can be 255 characters long' do
        profile = Fabricate.build(:profile, bio: 'N'*255)
        expect(profile).to be_valid
      end

      it 'cannot be 256 characters long' do
        profile = Fabricate.build(:profile, bio: 'N'*256)
        expect(profile).to be_invalid
      end
    end
  end
end

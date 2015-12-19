require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:follower) { Fabricate(:user) }
  let(:followed) { Fabricate(:profile)}

  describe 'assosciation' do
    it { should belong_to(:follower).class_name('User') }
    it { should belong_to(:followed).class_name('Profile') }
  end

  describe 'validation' do
    describe 'of follower' do
      it 'requires presence' do
        follower.id = nil
        expect(follower.save).to be false
      end
    end

    describe 'of followed' do
      it 'should not allow duplicates' do
        expect { followed.followers.create! follower: follower }.to_not raise_error
        expect { followed.followers.create! follower: follower }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  it 'should make follow' do
    expect(follower.followed_profiles.count).to eq(0)
    expect(followed.followers.count).to eq(0)
    followed.followers.create! follower: follower
    expect(follower.followed_profiles.count).to eq(1)
    expect(followed.followers.count).to eq(1)
  end
end

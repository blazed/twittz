require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'assosciation' do
    it { should belong_to :profile }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'validation' do
    let(:post) { Fabricate(:post) }

    describe 'of body' do
      it 'requires presence' do
        post.body = nil
        expect(post.save).to be false
      end
    end
  end
end

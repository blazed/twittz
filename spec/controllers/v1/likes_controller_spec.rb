require 'rails_helper'

RSpec.describe V1::LikesController, type: :controller do
  let(:user) { Fabricate(:user) }
  let(:user2) { Fabricate(:user) }
  let(:twitt) { Fabricate(:post) }

  before do
    sign_in(user)
  end

  describe "like" do

    it 'profile' do
      xhr :post, :like_profile, profile_id: user2.profile.id
      expect(response.status).to eq(200)
      expect(::JSON.parse(response.body)['profile']['id']).to eq(user2.profile.id)
    end

    it 'post' do
      xhr :post, :like_post, post_id: twitt.id
      puts twitt.id
      expect(::JSON.parse(response.body)['post_id']).to eq(twitt.id)
    end
  end
end

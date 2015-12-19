require 'rails_helper'

RSpec.describe V1::PostsController, type: :controller do
  let(:user) { Fabricate(:user) }

  before do
    sign_in(user)
  end

  describe "GET #show" do
    let(:post) { Fabricate(:post) }

    it "returns http success" do
      get :show, handle: user.handle, id: post.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it 'creates' do
      xhr :post, :create, post: { body: 'My new post' }
      expect(response.status).to eq(201)
      expect(::JSON.parse(response.body)['post']['body']).to eq("My new post")
    end

    context 'empty body' do
      it 'should return an error' do
        xhr :post, :create, post: { body: nil }
        expect(::JSON.parse(response.body)['errors']).to be_present
      end
    end
  end
end

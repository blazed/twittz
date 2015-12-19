require 'rails_helper'

RSpec.describe V1::ProfilesController, type: :controller do
  let(:user) { Fabricate(:user) }

  before do
    sign_in(user)
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, handle: user.handle
      expect(response).to have_http_status(:success)
    end
  end
end

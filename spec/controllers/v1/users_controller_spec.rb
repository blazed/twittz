require 'rails_helper'

RSpec.describe V1::UsersController, type: :controller do
  let(:user) { Fabricate(:user) }

  before do
    sign_in(user)
  end

  describe "GET #me" do
    it "returns http success" do
      get :me
      expect(response).to have_http_status(:success)
    end
  end
end

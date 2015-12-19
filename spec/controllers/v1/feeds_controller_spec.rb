require 'rails_helper'

RSpec.describe V1::FeedsController, type: :controller do
  let(:user) { Fabricate(:user) }

  before do
    sign_in(user)
  end

  describe "feed" do

    it 'shows' do
      xhr :get, :index
      expect(response.status).to eq(200)
    end
  end
end

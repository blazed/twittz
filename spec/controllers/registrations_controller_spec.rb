require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe "create" do
    before do
      Fabricate.create(:user)
      @request.env['devise.mapping'] = Devise.mappings[:user]
    end

    context "new user" do
      it 'created' do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response.status).to eq(201)
        expect(::JSON.parse(response.body)['user']['success']).to eq(true)
      end

      context 'empty email, handle and password' do
        it 'should return an error' do
          xhr :post, :create, user: { email: nil, password: nil, handle: nil }
          expect(::JSON.parse(response.body)['errors']).to be_present
        end
      end

      context 'empty email' do
        it 'should return an error' do
          xhr :post, :create, user: { email: nil, password: '1234', handle: 'handle' }
          expect(::JSON.parse(response.body)['errors']).to be_present
        end
      end

      context 'empty handle' do
        it 'should return an error' do
          xhr :post, :create, user: { email: 'email@example.com', password: '1234', handle: nil }
          expect(::JSON.parse(response.body)['errors']).to be_present
        end
      end

      context 'empty password' do
        it 'should return an error' do
          xhr :post, :create, user: { email: 'email@example.com', password: nil, handle: 'handle' }
          expect(::JSON.parse(response.body)['errors']).to be_present
        end
      end
    end
  end
end

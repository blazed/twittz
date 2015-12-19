require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'create' do
    let(:user) { Fabricate(:user) }

    context 'invalid password' do
      it 'should return an error' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        xhr :post, :create, user: { email: user.email, password: '1234' }, format: :json
        expect(::JSON.parse(response.body)['error']).to be_present
      end
    end

    context 'empty login and password' do
      it 'should return an error' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        xhr :post, :create, user: { email: nil, password: nil, }, format: :json
        expect(::JSON.parse(response.body)['error']).to be_present
      end
    end

    context 'empty login' do
      it 'should return an error' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        xhr :post, :create, user: { password: '1234' }, format: :json
        expect(::JSON.parse(response.body)['error']).to be_present
      end
    end

    context 'empty password' do
      it 'should return an error' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        xhr :post, :create, user: { email: user.email }, format: :json
        expect(::JSON.parse(response.body)['error']).to be_present
      end
    end
  end
end

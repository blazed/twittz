class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    data = {
      id: self.resource.id,
      email: self.resource.email,
      token: self.resource.authentication_token
    }
    render json: data, status: 201
  end

  def destroy
    sign_out :user
    render nothing: true
  end
end

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }, skip: [:passwords]

  scope module: :v1 do
    get 'users/me' => 'users#me'
  end

end

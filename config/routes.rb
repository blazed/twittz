Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }, skip: [:passwords], defaults: { format: :json  }

  scope '/v1', module: :v1 do
    get 'users/me' => 'users#me'

    get 'profiles/:handle' => 'profiles#show'
  end

end

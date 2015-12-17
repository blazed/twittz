Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }, skip: [:passwords], defaults: { format: :json  }

  scope '/v1', module: :v1 do
    get 'users/me' => 'users#me'

    get 'profiles/:handle' => 'profiles#show'
    get 'profiles/:handle/posts/:id' => 'posts#show'

    post 'posts' => 'posts#create'

    post 'likes/profile' => 'likes#like_profile'
    post 'likes/post' => 'likes#like_post'

    get 'feed' => 'feeds#index'
  end

end

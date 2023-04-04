Rails.application.routes.draw do
  devise_for :users do 
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: "albums#index"
  get '/my_albums' ,to: 'albums#my_albums'
  get 'tags/:tag', to: 'albums#index', as: :tag
  resources :albums do
    member do
      delete :purge_audio
    end 
  end
end

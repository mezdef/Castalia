Castalia::Application.routes.draw do

  mount Mercury::Engine => '/'
  Mercury::Engine.routes

  devise_for :users, 
    controllers: {
      registrations: 'users/registrations',
      passwords: 'users/passwords'
    },
    path_names: {
      sign_up: 'registration',
      create: 'registration'
    }

  root :to => "pages#home"

  namespace :users do
    get :resetpassword
  end
  resources :users

  resource :about, controller: :about, except: :show do
    get :index
  end

  resource :calendar, as: :event, controller: :events do
    get :index
  end
  
  post 'about/mercury_update', to: 'about#mercury_update', as: :mercury_update_about

end

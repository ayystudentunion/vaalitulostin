Ehdokastiedot::Application.routes.draw do

  # Devise routes must be on top to get highest priority
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :advocate_users
  devise_for :voting_area_users

  ActiveAdmin.routes(self)

  root :to => "public#index"
  get "/advocates", :to => "public#index", :as => :advocate_index

  namespace :advocates do
    get :index, :as => :advocates
    resources :alliances do
      resources :candidates
    end
  end

  namespace :voting  do
    get "/", :to => "voters#index"

    resources :voters do
      collection do
        get :search
      end

      put :mark_voted

    end

    resource :vote_amounts, :only => [:show, :create] do
      member do
        post :mark_submitted
      end
    end

  end

  namespace :manage do
    get "configuration", :to => "configurations#index"
    resource :configuration, :only => [:index, :update, :edit] do
      put :disable_advocate_login, :to => "configurations#disable_advocate_login"
      put :enable_advocate_login,  :to => "configurations#enable_advocate_login"
    end

    resources :candidates, :only => [:index]
    resources :electoral_coalitions, :only => [:index]
    resources :electoral_alliances, :only => [:index]

    resources :voters, :only => [:index]

    resource :danger_zone, :only => [:show]

    resources :candidate_attribute_changes

    resources :results, :only => [:index, :show] do
      put :publish
    end
  end


  namespace :draws, :as => "" do
    get :index, :as => :draws
    resources :coalitions, :as => :coalition_draws
    resources :alliances, :as => :alliance_draws
    resources :candidates, :as => :candidate_draws
    post :candidate_draws_ready
    post :alliance_draws_ready
    post :coalition_draws_ready
  end

  resources :checking_minutes, :only => [:index, :show, :edit, :update] do
    collection do
      get :fixes
      get :summary
      post :ready
    end
  end

  resources :listings, :only => [] do
    collection do
      get :simple
      get :same_ssn
      get :showdown
      post :showdown, :action => 'showdown_post'
      get :lulz
    end
  end

end

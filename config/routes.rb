Rails.application.routes.draw do

  root "application#home"

  get '/results' => "application#results"

  namespace :api do
    resources :face_search
  end

end

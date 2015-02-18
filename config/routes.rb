Rails.application.routes.draw do

  namespace :api do
    resources :face_search
    resources :insta_search
  end

end

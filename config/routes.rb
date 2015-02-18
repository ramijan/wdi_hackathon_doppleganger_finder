Rails.application.routes.draw do

  namespace :api do
    resources :face_search
  end

end

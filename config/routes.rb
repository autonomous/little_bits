Rails.application.routes.draw do
  resources :letter_distributions, only: %i[new create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'letter_distributions#new'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :memos
# or get "/" to 'controllername#functionname'
# post "/create" to 'dd#dd'

# can make all memo routes nested after user:
# resources :users do:
  # resources :memos
# end

end

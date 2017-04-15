Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'employees#index'
  match ':controller(/:action(/:id))', :via => :get 
  
  post 'employees/create'
  post 'employees/update'
  post 'employees/destroy'

end

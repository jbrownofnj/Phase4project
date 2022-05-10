Rails.application.routes.draw do
  resources :reminders,only:[:index,:show,:create,:update,:destroy]
  resources :friend_codes,only:[:index,:show,:create,:update,:destroy]
  resources :preperations,only:[:index,:show,:create,:destroy]
  resources :events,only:[:index,:show,:create,:update,:destroy]
  resources :prereqs,only:[:index,:show,:create,:destroy]
  resources :view_permissions,only:[:index,:show,:create,:destroy]
  resources :tasks,only:[:index,:show,:create,:update,:destroy]
  resources :users,only:[:index,:show,:create,:update,:destroy]

  post "/login", to: 'session#login'
  delete "/logout", to:'session#logout'
end

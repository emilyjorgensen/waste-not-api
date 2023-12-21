Rails.application.routes.draw do
  get "/ingredients" => "ingredients#index"
  post "/ingredients" => "ingredients#create"
  get "/ingredients/:id" => "ingredients#show"
  patch "/ingredients/:id" => "ingredients#update"
  delete "/ingredients/:id" => "ingredients#destroy"

  post "/users" => "users#create"
end

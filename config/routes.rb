Rails.application.routes.draw do
  get "/ingredients" => "ingredients#index"
  post "/ingredients" => "ingredients#create"
  get "/ingredients/:id" => "ingredients#show"
  patch "/ingredients/:id" => "ingredients#update"
  delete "/ingredients/:id" => "ingredients#destroy"

  post "/users" => "users#create"
  get "/users" => "users#index"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"

  get "/pantry_items" => "pantry_items#index"
  post "/pantry_items" => "pantry_items#create"
  get "/pantry_items/:id" => "pantry_items#show"
  patch "/pantry_items/:id" => "pantry_items#update"
  delete "/pantry_items/:id" => "pantry_items#destroy"
end

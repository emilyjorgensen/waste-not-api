Rails.application.routes.draw do
  get "/ingredients" => "ingredients#index"
  post "/ingredients" => "ingredients#create"
end

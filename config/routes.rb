Rails.application.routes.draw do
  get '/birds' => 'birds#index'
  get '/birds/:id' => 'birds#show'
  post '/birds' => 'birds#create'
end
Rails.application.routes.draw do
  get "/timeline"=>"post#timeline"
  get "/"=>"home#top"
  get '/login'=>"home#login_form"
  get "/logout"=>"home#logout"
  get "/register"=>"home#register"
  get "/newpost"=>"post#newpost"
  get "/:user_id/:id/edit"=>"post#edit"
  get "/:user_id/:id/confirm"=>"post#confirm"
  get "/:user_id/edit_inf"=>"home#edit_inf"
  get "/:user_id/:id"=>"post#show"
  get '/:user_id'=>"post#mypage"
  post "login"=>"home#login"
  post "/register/create"=>"home#create"
  post "/register/change"=>"home#change"
  post "/posts/create"=>"post#create"
  post "post/:id/save"=>"post#save"
  post "post/:id/delete"=>"post#delete"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

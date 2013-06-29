AmapMailer::Application.routes.draw do

  namespace :admin do
    resources :subscribers
    resources :categories
    resources :newsletters
  end

  resources :subscribers, :except => [:index, :show, :edit]
  get '/subscribers/:id', :to => 'subscribers#edit', :as => 'edit_subscriber'

  mount RedactorRails::Engine => '/redactor_rails'

end

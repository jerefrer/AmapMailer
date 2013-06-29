AmapMailer::Application.routes.draw do

  namespace :admin do
    resources :subscribers
    resources :categories
    resources :newsletters
  end

  mount RedactorRails::Engine => '/redactor_rails'

  root :to => 'newsletters#index'

end

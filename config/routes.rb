AmapMailer::Application.routes.draw do

  resources :subscribers


  resources :categories


  resources :newsletters


  mount RedactorRails::Engine => '/redactor_rails'

end

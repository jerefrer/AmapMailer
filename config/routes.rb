AmapMailer::Application.routes.draw do

  resources :categories


  resources :newsletters


  mount RedactorRails::Engine => '/redactor_rails'

end

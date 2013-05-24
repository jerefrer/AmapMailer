AmapMailer::Application.routes.draw do

  resources :newsletters


  mount RedactorRails::Engine => '/redactor_rails'

end

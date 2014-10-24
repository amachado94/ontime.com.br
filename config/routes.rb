Rails.application.routes.draw do
  
  root to: 'user#index'
  devise_for :users, path: 'usuario', path_names: {sign_in: 'acessar', sign_out: 'sair'}
  
  get 'usuario', to: 'user#index', as: 'user'

end

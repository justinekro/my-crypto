Rails.application.routes.draw do
  root 'cryptos#index'
  resources :cryptos
  
  get "cryptos/search/:crypto", to: "cryptos#search", as: "search"
end

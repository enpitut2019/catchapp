Rails.application.routes.draw do
  get "papers/index"
  get "papers/all"
  get "keywords/index"
  get "authors/index"
  post "papers/create"
end

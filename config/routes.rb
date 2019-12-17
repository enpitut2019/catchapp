Rails.application.routes.draw do
  get "papers/index"
  get "papers/all"
  get "keywords/index"
  get "authors/index"
  post "papers/create"
  post "papers/upload"
  post "search/get_xml"
  get "translate", to: "translate#get"
  post "translate", to: "translate#set"
end

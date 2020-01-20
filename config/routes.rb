Rails.application.routes.draw do
  get "paper/:id", to: "papers#show"
  get "keywords/index"
  get "authors/index"
  post "papers/create"
  post "papers/upload"
  post "search/get_xml"
  get "translate", to: "translate#get"
  post "translate", to: "translate#set"
  post "papers/get_figure"
end

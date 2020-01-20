Rails.application.routes.draw do
  get "papers/index" # 非推奨
  get "papers/all" # 非推奨
  get "papers", to: "papers#all"
  get "paper/:id", to: "papers#show"
  get "keywords/index"
  get "authors/index"
  post "papers/create"
  post "papers/upload" # 非推奨
  post "figures/upload", to: "papers#upload"
  post "search/get_xml" # 非推奨
  get "papers/search", to: "search#get_xml"
  get "translate", to: "translate#get"
  post "translate", to: "translate#set"
  post "papers/get_figure"
end

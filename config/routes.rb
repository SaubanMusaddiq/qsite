Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  get 'chapters', to: "chapters#index"
  # get 'chapters/:id', to: "chapters#show" , as:"chapter"
  # get 'chapters/:id/verses', to: "chapters#show"
  # get 'chapters/:id/verses/:v_id1', to: "verses#show", as:"chapter_verse"
  # get 'chapters/:id/verses/:v_id1/:v_id2', to: "verses#show", as:"chapter_verses"

  get '/intro', to: 'welcome#intro'
  get '/info', to: 'welcome#info'
  get '/publisher', to: 'welcome#publisher'
  get '/notes', to: 'welcome#notes'
  get '/contact', to: 'welcome#contact'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'
  root 'welcome#index'
  get    '/admin',   to: 'users#admin'
  get    '/admin/analytics',   to: 'users#analytics'
  get    '/admin/configs',   to: 'users#configs'
  get    '/admin/files',   to: 'users#files'
  post   '/admin/file_save/:id', to: 'users#file_save'
  get    '/admin/download_file_kn/:id',   to: 'users#download_file_kn'
  get    '/admin/download_file_ar/:id',   to: 'users#download_file_ar'

  get '/:id', to: "chapters#show" , as:"chapter"
  get '/:id/:v_id1', to: "verses#show", as:"chapter_verse"

end

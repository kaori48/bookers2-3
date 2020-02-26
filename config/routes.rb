Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'#localhosst3000する
  get 'home/about' => 'homes#about'
  resources :users
  #いいね機能のルーティング
  #コメント、いいねは本の投稿に対してコメントされます。このため、boo_commennts/favoritesは、booksに結びつきます。以下のように親子関係になります。
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
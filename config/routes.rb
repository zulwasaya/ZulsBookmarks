ZulsBookmarks::Application.routes.draw do
  resources :bookmarks
  root :to => 'sessions#new'
#  get   '/login', :to => 'sessions#new', :as => :login
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
  get '/logout', :to => 'sessions#destroy'

  get 'check_urls' => 'bookmarks#check_urls'
  get 'sortform' => 'bookmarks#sortform'
  get 'sortbookmarks' => 'bookmarks#sortbookmarks'
  get 'searchform' => 'bookmarks#searchform'
  get 'searchbookmarks' => 'bookmarks#searchbookmarks'
  get 'favoritebookmarks' => 'bookmarks#favoritebookmarks'
  get 'from_html_file' => 'bookmarks#from_html_file'
  get 'from_sample_file' => 'bookmarks#from_sample_file'
  get 'to_html_file' => 'bookmarks#to_html_file'
  get 'destroy_all' => 'bookmarks#destroy_all'
  get '/emailform', :to => 'bookmarks#emailform'
  get '/mailbookmarks', :to => 'bookmarks#mailbookmarks'
  get '/about', :to => 'bookmarks#about'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   get 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   get 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.old.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # get ':controller(/:action(/:id))(.:format)'
end

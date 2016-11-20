# == Route Map
#
#                      Prefix Verb   URI Pattern                                                Controller#Action
#               user_messages POST   /user_messages(.:format)                                   user_messages#create
#                        root GET    /                                                          categories#index
#           new_admin_session GET    /admins/sign_in(.:format)                                  devise/sessions#new
#               admin_session POST   /admins/sign_in(.:format)                                  devise/sessions#create
#       destroy_admin_session DELETE /admins/sign_out(.:format)                                 devise/sessions#destroy
#     category_category_items GET    /categories/:category_id/category_items(.:format)          category_items#index
#                             POST   /categories/:category_id/category_items(.:format)          category_items#create
#  new_category_category_item GET    /categories/:category_id/category_items/new(.:format)      category_items#new
# edit_category_category_item GET    /categories/:category_id/category_items/:id/edit(.:format) category_items#edit
#      category_category_item GET    /categories/:category_id/category_items/:id(.:format)      category_items#show
#                             PATCH  /categories/:category_id/category_items/:id(.:format)      category_items#update
#                             PUT    /categories/:category_id/category_items/:id(.:format)      category_items#update
#                             DELETE /categories/:category_id/category_items/:id(.:format)      category_items#destroy
#                  categories GET    /categories(.:format)                                      categories#index
#                             POST   /categories(.:format)                                      categories#create
#                new_category GET    /categories/new(.:format)                                  categories#new
#               edit_category GET    /categories/:id/edit(.:format)                             categories#edit
#                    category GET    /categories/:id(.:format)                                  categories#show
#                             PATCH  /categories/:id(.:format)                                  categories#update
#                             PUT    /categories/:id(.:format)                                  categories#update
#                             DELETE /categories/:id(.:format)                                  categories#destroy
#                    download GET    /download(.:format)                                        application#handle_file_output_request
#

Rails.application.routes.draw do

    resources :user_messages, only: [:create]

    root 'categories#index'

    devise_for :admins

    resources :categories do
        resources :category_items do
            put :sort, on: :collection
        end
        put :sort, on: :collection
    end

    get 'download' => 'application#handle_file_output_request'

    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # You can have the root of your site routed with "root"
    # root 'welcome#index'

    # Example of regular route:
    #   get 'products/:id' => 'catalog#view'

    # Example of named route that can be invoked with purchase_url(id: product.id)
    #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

    # Example resource route (maps HTTP verbs to controller actions automatically):
    #   resources :products

    # Example resource route with options:
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

    # Example resource route with sub-resources:
    #   resources :products do
    #     resources :comments, :sales
    #     resource :seller
    #   end

    # Example resource route with more complex sub-resources:
    #   resources :products do
    #     resources :comments
    #     resources :sales do
    #       get 'recent', on: :collection
    #     end
    #   end

    # Example resource route with concerns:
    #   concern :toggleable do
    #     post 'toggle'
    #   end
    #   resources :posts, concerns: :toggleable
    #   resources :photos, concerns: :toggleable

    # Example resource route within a namespace:
    #   namespace :admin do
    #     # Directs /admin/products/* to Admin::ProductsController
    #     # (app/controllers/admin/products_controller.rb)
    #     resources :products
    #   end
end

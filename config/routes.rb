Rails.application.routes.draw do

#Alfredo
  get 'profiles/index'

  get 'registration_users/registeruser'
  
  #get 'executives/index'

  get 'executives/' => 'executives#index'

  post 'executives/create'

  post 'executives/create_call'

  post 'executives/correo' => 'executives#correo'
#Fin alfredo

#Saul
  #get 'clients/index'

  #get 'enterprises/enterpriseconfigurations'

  #get 'enterprisesuser2/enterprisesuserregistration2'
  #get 'enterprisesuser/enterprisesuserregistration'

  #get 'enterprisesuser/enterprisesuserregistration'

  #Vista de cliente de la empresa
  #get 'enterprises/contacts_registration'

  #get 'enterprises/meeting'

  #get 'enterprises/employees_registration'

  #get 'enterprises/products_registration'

  #get 'enterprises/index'


#FIN Saul

#Jose Luis
  get '/buscador/' => 'buscador#index' 

  get 'promotion_afiliations/' => 'promotion_afiliations#index'
  post 'promotion_afiliations/create'
  post 'promotion_afiliations/correo' => 'promotion_afiliations#correo'
  get '/promotion_afiliations/buscar_promociones'
  resources :memberships do
    resources :promotion_memberships
  end



  get '/companies/'=> 'companies#index'

  get '/memberships/' => 'memberships#index'

  get '/benefits/' => 'benefits#index'

  get '/configurations/' => 'configurations#index'

  resources :benefits

  get '/settings/' => 'settings#index'

  resources :permissions

  get '/roles' => 'roles#index'
  get '/roles/buscar_roles'
  resources :roles

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'welcome/index'

  #get 'users/add'
  #post 'users/create'

  #resources :users

  #Buscador de AtlasCRM
  post 'buscador/result'

  post 'users/crear_user_enterprise'
  post 'users/crear_user_cliente'

  get 'users/validate_user'

  #Sesiones
  post 'sessions/create'
  post 'sessions/create_enterprise'

  delete '/logout' => 'sessions#destroy'
  delete '/logout_enterprise' => 'sessions#destroy_enterprise'

  #Fin Jose Luis

  #Gleiber
  #get 'generar_reporte_promociones/generar_reporte_promociones'

  #get 'generar_reporte_cliente/generar_reporte_cliente'

  #get 'reporte_por_cliente/reporte_por_cliente'

  #get 'reporte_producto/reporte_de_producto'
  #Fin Gleiber

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

  #Intranet del proyecto
  #resources :www, constraints: { id: /[A-Z][A-Z][0-9]+/ } do
  #  resources :template
  #end

  get '/www.:nom_intranet.atlascrm.com' => 'www#atlascrm_com' , as: :atlascrm_com
  get '/www.:nom_intranet.atlascrm.com/template' => 'template#configuration' , as: :template_configuration
  get '/www.:nom_intranet.atlascrm.com/enterprise' => 'enterprises#index' , as: :enterprises_index
  get '/www.:nom_intranet.atlascrm.com/clients' => 'clients#index' , as: :clients_index
  get '/www.:nom_intranet.atlascrm.com/executives' => 'executives#index' , as: :executives_index
  post 'enterprises/crear_executive_enterprise'
  post 'template/create'
  post 'template/update'

  #resources :www do
  #  get '/template' => 'template#configuration' , as: :template_configuration
  #  post 'template/create'
  #  post 'template/update'
  #end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :people, except: %i[new edit] do
    collection do
      get 'filter_by_city'
      get 'group_by_age_with_degree'
    end
  end
end

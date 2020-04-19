Rails.application.routes.draw do
  resources :academic_projects
  resources :works
  resources :educations
  resources :users do
    get "generate_resume", :on => :member
  end
  resources :employees
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  
  resources :users, only: [:show, :create, :update, :destroy] 
  resources :profiles, only: [:show, :create, :update, :destroy]
  resources :applications, only: [:create, :update, :destroy]
  resources :jobs
  resources :job_seekers, only: [:show, :update, :destroy] do
    get 'view_jobs', on: :collection
    get 'view_applications', on: :member
  end

  resources :job_recruiters, only: [:show, :update, :destroy] do
    get 'view_created_jobs', on: :member
  end

end

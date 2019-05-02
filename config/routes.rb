Rails.application.routes.draw do
  get 'reviews/index'
  resources :reviews do
    get :autocomplete_course_club_name, :on => :collection
  	resources :hole_reviews do
  		resources :images, :only => [:create, :destroy] # support #create and #destroy
      get :autocomplete_course_course_name, :on => :collection
  	end
  end
  resources :courses
  root 'reviews#index'
end

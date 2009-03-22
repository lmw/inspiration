ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'images'
  map.resources :images, :collection => {:add_new => :get}
  map.large_image 'images/large/:id', :controller => 'images', :action => 'large'
end

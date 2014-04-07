BusTimetable::Application.routes.draw do
  resources :stations, { except: [:destroy, :update] }
end

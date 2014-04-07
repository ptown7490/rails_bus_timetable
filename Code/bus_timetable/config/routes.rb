BusTimetable::Application.routes.draw do
  resources :stations, { except: [:show] }
end

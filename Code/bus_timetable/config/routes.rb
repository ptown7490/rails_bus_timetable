BusTimetable::Application.routes.draw do
  resources :stations, { except: [:update, :show] }
end

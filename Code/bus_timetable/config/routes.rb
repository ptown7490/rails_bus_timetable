BusTimetable::Application.routes.draw do
  resources :stations, { except: [:show] }
  resources :lines, { except: [:show] }
end

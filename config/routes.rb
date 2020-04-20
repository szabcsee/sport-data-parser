Rails.application.routes.draw do
  root to: 'site#index'
  namespace :api do
    namespace :v1 do
      scope :sports do
        get 'sport-by-id/:id' => 'sports#get_sport_by_id'
        get 'all' => 'sports#get_all_sports'
        scope :events do
          get 'all' => 'events#get_all_events'
          get 'events-by-sport-id/:id' => 'events#get_events_by_sport_id'
          get 'event-by-id/:id' => 'events#get_event_by_id'
          scope :outcomes do
            get 'outcome-by-id/:id' => 'outcomes#get_all_outcomes_by_event'
          end
        end
      end
    end
  end
end
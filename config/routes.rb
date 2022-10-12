Rails.application.routes.draw do
  root to: "refrigerator#index"

  get 'refrigerator' , :to => "refrigerator#index"
  delete 'refrigerator', :to => "refrigerator#destroy"

  get 'genre', :to => "refrigerator#genre"
  get 'recipe', :to => "refrigerator#recipe"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

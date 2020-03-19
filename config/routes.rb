# frozen_string_literal: true

Rails.application.routes.draw do
  #> create topics
  #> create cards
  #> create a new session
  #> create a session item outcome
  resources :topics do
    resources :cards
  end
end

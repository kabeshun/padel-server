module Api
  class ApplicationController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken
    protect_from_forgery

  end
end
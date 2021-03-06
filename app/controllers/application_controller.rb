class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Ensure that users can't browser without being logged in
  before_action :authenticate_user!
  # before_action :authenticate_user, except: [:index, :show]
end

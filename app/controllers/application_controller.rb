class ApplicationController < ActionController::Base
  # Enables cross-site request forgery attack protections.
  protect_from_forgery with: :exception

  # All visitors to the site must be signed in.
  before_action :authenticate_user!
end

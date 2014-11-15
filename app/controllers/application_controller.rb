class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #filter_parameter_logging "password"

  #protect_from_forgery with: :exception
  protect_from_forgery
  skip_before_action :verify_authencity_token, if: :json_request?

  protected

  def json_request?
    request.format.json?
  end
end

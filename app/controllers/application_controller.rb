class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def handle_unverified_request
    log_out
    super
  end

end

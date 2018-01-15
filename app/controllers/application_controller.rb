class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.include? 'application/json' }

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end

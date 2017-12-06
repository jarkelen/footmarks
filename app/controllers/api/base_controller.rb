class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  before_action :destroy_session, :check_token

  def destroy_session
    request.session_options[:skip] = true
  end

  private def check_token
    if params[:api_token].blank?
      render json: "Provide an API token".to_json, status: :unprocessable_entity
    elsif params[:api_token] != "footmarks-4637433929"
      render json: "API token not correct".to_json, status: :unprocessable_entity
    end
  end

  def not_found
    render json: "Not found", status: 404
  end
end

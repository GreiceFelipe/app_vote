class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    skip_before_action :verify_authenticity_token

    protected

    # Allow adding the name attribute using the devise sign_up method
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end

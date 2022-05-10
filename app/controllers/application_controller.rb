class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record_message
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_message

    include ActionController::Cookies
    def current_user
        User.find_by(id: session[:current_user])
    end

    def authorize_user
        return render json: { error: "Not Authorized" }, status: :unauthorized unless current_user
    end

    def is_admin
        return render json: { error: "Not Authorized" }, status: :unauthorized unless current_user.admin
    end

    private

    def render_invalid_record_message(invalid)
        render json: {errors: invalid.record.errors}
    end
    def render_record_not_found_message(missing)
        render json: {errors: missing}
    end

end

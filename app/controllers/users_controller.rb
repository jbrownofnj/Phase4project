class UsersController < ApplicationController
    before_action :authorize_user,  only: [:index,:show,:create, :destroy, :update]
    before_action :is_admin, only: [:index,:show,:create, :destroy, :update]
    def index
    render json: User.all
    end

    def show
        render json:User.find(params[:id])
    end

    def create
        newUser=User.create!(user_params)
        render json:newUser, status: :created
    end

    def update
        updatedUser=User.find(params[:id])
        updatedUser.update!(user_params)
        render json:updatedUser, status: :created
    end

    def destroy
        destroyedUser=User.find(params[:id])
        destroyedUser.destroy
        head :no_content
    end

    private

    def user_params
        params.permit(:user_name,:color_coefficient,:user_email,:password)
    end
end

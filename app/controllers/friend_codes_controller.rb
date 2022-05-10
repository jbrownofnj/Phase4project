class FriendCodesController < ApplicationController
    before_action :is_admin, only: [:create, :destroy, :update]
    def index
        render json: FriendCode.all
    end

    def show
        render json:FriendCode.find(params[:id])
    end

    def create
        new_friend_code=FriendCode.create!(friend_code_params)
        render json:new_friend_code, status: :created
    end

    def destroy
        destroyed_friend_code=FriendCode.find(params[:id])
        destroyed_friend_code.destroy
        head :no_content
    end

    private

    def friend_code_params
        params.permit(:password,:user_id)
    end

end

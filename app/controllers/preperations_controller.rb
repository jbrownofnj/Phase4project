class PreperationsController < ApplicationController
    before_action :is_admin, only: [:create, :destroy, :update]
    def index
        render json: Preperation.all
    end

    def show
        render json:Preperation.find(params[:id])
    end

    def create
        new_preperation=Preperation.create!(preperation_params)
        render json:new_preperation, status: :created
    end

    def destroy
        destroyed_preperations=Preperation.find(params[:id])
        destroyed_preperations.destroy
        head :no_content
    end

    private

    def preperation_params
        params.permit(:event_id,:event_task_preperation_id)
    end
end

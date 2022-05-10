class PrereqsController < ApplicationController
    before_action :is_admin, only: [:create, :destroy, :update]
    def index
        render json: Prereq.all
    end

    def show
        render json:Prereq.find(params[:id])
    end

    def create
        new_prereq=Prereq.create!(prereq_params)
        render json:new_prereq, status: :created
    end

    def destroy
        destroyed_prereq=Prereq.find(params[:id])
        destroyed_prereq.destroy
        head :no_content
    end

    private

    def prereq_params
        params.permit(:task_id,:required_task_id)
    end
end

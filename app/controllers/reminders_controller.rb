class RemindersController < ApplicationController
    before_action :is_admin, only: [:create, :destroy, :update]
    def index
        render json: Reminder.all
    end

    def show
        render json:Reminder.find(params[:id])
    end

    def create
        new_reminder=Reminder.create!(reminder_params)
        render json:new_reminder, status: :created
    end

    def destroy
        destroyed_reminder=Reminder.find(params[:id])
        destroyed_reminder.destroy
        head :no_content
    end

    private

    def reminder_params
        params.permit(:reminder_date,:task_id)
    end
end

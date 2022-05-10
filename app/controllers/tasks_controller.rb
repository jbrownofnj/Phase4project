class TasksController < ApplicationController
        def index
        render json: Task.all
        end
    
        def show
            render json:Task.find(params[:id])
        end
    
        def create
            new_task=Task.create!(task_params)
            render json:new_task, status: :created
        end
    
        def update
            updataedTask=Task.find(params[:id])
            updataedTask.update!(task_params)
            render json:updataedTask, status: :created
        end
    
        def destroy
            destroyed_task=Task.find(params[:id])
            destroyed_task.destroy
            head :no_content
        end
    
        private
    
        def task_params
            params.permit(:task_name,:task_description,:task_location,:task_contact,:duration,:user_id)
        end
end

class EventsController < ApplicationController
    before_action :is_admin, only: [:create, :destroy, :update]
    def index
        render json: Event.all
        end
    
        def show
            render json:Event.find(params[:id])
        end
    
        def create
            new_event=Event.create!(event_params)
            render json:new_event, status: :created
        end
    
        def update
            updated_event=Event.find(params[:id])
            updated_event.update!(event_params)
            render json:updated_event, status: :created
        end
    
        def destroy
            destroyed_event=Event.find(params[:id])
            destroyed_event.destroy
            head :no_content
        end
    
        private
    
        def event_params
            params.permit(:event_name,:event_description,:event_location,:event_contact,:event_start,:event_end,:user_id)
        end
end

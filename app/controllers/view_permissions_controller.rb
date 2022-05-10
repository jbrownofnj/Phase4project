class ViewPermissionsController < ApplicationController
        def index
            render json: ViewPermission.all
        end
    
        def show
            render json:ViewPermission.find(params[:id])
        end
    
        def create
            new_view_permission=ViewPermission.create!(view_permission_params)
            render json:new_view_permission, status: :created
        end
    
        def destroy
            destroyed_view_permission=ViewPermission.find(params[:id])
            destroyed_view_permission.destroy
            head :no_content
        end
    
        private
    
        def view_permission_params
            params.permit(:viewable_user,:user_id)
        end
end

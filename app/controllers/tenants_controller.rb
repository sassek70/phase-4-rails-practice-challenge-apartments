class TenantsController < ApplicationController

    def index
        render json: Tenant.all, status: :ok
    end

    def show
        render json: Tenant.find(params[:id]), status: :ok
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update!(tenant_params)
        render json: tenant, status: :accepted
    end

    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy!
        head :no_content
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end
    

end

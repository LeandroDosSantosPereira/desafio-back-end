module Api
  module V1
    class RegistrationsController < ApplicationController
      def create
        #NewRegistrationWorker.perform_async("name_account" => params[:name_account], "name_entity" => params[:name_entity])

        result = CreateRegistration.call(create_params)

        if result.success?
          render json: result.data, status: :created
        else
          render json: { error: result.error }, status: :unprocessable_entity
        end
      end

      private

      def create_params
        params.require(:account)
        .permit(:name_account, :from_partner, :many_partners, :phone_account,  :name_entity)        
      end
    end
  end
end

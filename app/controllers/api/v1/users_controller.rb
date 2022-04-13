module Api
  module V1
    class UsersController < ApplicationController
      def create
        result = CreateUser.call(create_params)

        if result.success?
          render json: result.data, status: :created
        else
          render json: { error: result.error }, status: :unprocessable_entity
        end
      end

      private

      def create_params
        params.require(:user)
              .permit(:first_name, :last_name, :email, :phone, :confirmed_at)
      end
    end
  end
end

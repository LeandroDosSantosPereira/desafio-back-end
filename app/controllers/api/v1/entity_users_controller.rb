module Api
  module V1
    class EntityUsersController < ApplicationController
      def create
        result = CreateEntityUser.call(create_params)

        if result.success?
          render json: result.data, status: :created
        else
          render json: { error: result.error }, status: :unprocessable_entity
        end
      end

      private

      def create_params
        params.require(:entity_user).permit(:user_email,  :account_name)
      end
    end
  end
end

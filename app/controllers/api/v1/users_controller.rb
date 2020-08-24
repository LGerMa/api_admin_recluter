class Api::V1::UsersController < Api::BaseController
  before_action :doorkeeper_authorize!

  def me
    render json: current_resource_owner, serializer: Api::V1::UserSerializer
  end

  def create

  end

  private
    def user_params

    end
end

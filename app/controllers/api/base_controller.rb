class Api::BaseController < ApplicationController
  include Response
  respond_to :json
  private

    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
end

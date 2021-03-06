class Api::V1::PhonesController < Api::BaseController
  include PolymorphicAssociationConcern
  before_action :find_phoneable
  before_action :set_phone, only: [:show, :update]

  def index
    json_response @phoneable.phones,
                  each_serializer: Api::V1::PhoneSerializer
  end

  def create
    json_response @phoneable.phones.create(phone_params),
                  status: :created
  rescue Exception => e
    error = {'message': e.message}
    json_response error, status: :unprocessable_entity
  end

  def show
    json_response @phone
  end

  def update
    if @phone.update(phone_params)
      json_response @phone
    else
      json_response @phone.errors,
                    status: :unprocessable_entity
    end
  end

  private
    def find_phoneable
      klass = getKlass
      @klass = klass['klass']
      @phoneable = @klass.find(klass['value'])
    rescue
      json_response status: :not_found
    end

    def phone_params
      params.require(:phone).permit(
        :phone_type, :phone_number
      )
    end

    def set_phone
      @phone = @phoneable.phones.find(params[:id])
    rescue
      json_response status: :not_found
    end
end

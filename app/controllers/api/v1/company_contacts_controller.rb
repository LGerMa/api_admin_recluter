class Api::V1::CompanyContactsController < Api::BaseController

  include PolymorphicAssociationConcern

  before_action :find_contactable
  before_action :set_company_contact, only: [:show, :update]

  def index
    json_response @contactable.company_contacts,
                  each_serializer: Api::V1::CompanyContactSerializer
  end

  def create
    json_response @contactable.company_contacts.create!(company_contact_params),
                  status: :created
  rescue Exception => e
    error = {'message': e.message}
    json_response error, status: :unprocessable_entity
  end

  def show
    json_response @company_contact
  end

  def update
    if @company_contact.update(company_contact_params)
      json_response @company_contact
    else
      json_response @company_contact.errors,
                    status: :unprocessable_entity
    end
  end

  private

    def find_contactable
      klass = getKlass
      @klass = klass['klass']
      @contactable = @klass.find(klass['value'])
    rescue
      json_response status: :not_found
    end

    def company_contact_params
      params.require(:company_contact).permit(
          :contact_name, :contact_position, :contact_phone, :contact_email
      )
    end

    def set_company_contact
      @company_contact = @contactable.company_contacts.find(params[:id])
    rescue
      json_response status: :not_found
    end

end

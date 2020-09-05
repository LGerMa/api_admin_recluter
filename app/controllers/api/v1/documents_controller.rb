class Api::V1::DocumentsController < Api::BaseController

  include PolymorphicAssociationConcern

  before_action :find_documentable
  before_action :set_document, only: [:show, :update]

  def index
    json_response @documentable.documents,
                  each_serializer: Api::V1::DocumentSerializer
  end

  def create
    json_response @documentable.documents.create(document_params),
                  status: :created
  rescue Exception => e
    error = {'message': e.message}
    json_response error, status: :unprocessable_entity
  end

  def show
    json_response @document
  end

  def update
    if @document.update(document_params)
      json_response @document
    else
      json_response @document.errors,
                    status: :unprocessable_entity
    end
  end

  private
    def find_documentable
      klass = getKlass
      @klass = klass['klass']
      @documentable = @klass.find(klass['value'])
        rescue
      json_response status: :not_found
    end

    def document_params
      params.require(:document).permit(
          :document_type, :document_value
      )
    end

    def set_document
      @document = @documentable.documents.find(params[:id])
    rescue
      json_response status: :not_found
    end
end

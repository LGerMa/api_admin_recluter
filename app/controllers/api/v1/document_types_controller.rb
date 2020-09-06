class Api::V1::DocumentTypesController < Api::BaseController

  before_action :set_document_type, only: [:show, :update]


  def index
    json_response DocumentType.all,
                  each_serializer: Api::V1::DocumentTypeSerializer
  end

  def create
    json_response DocumentType.create!(document_type_params),
                  status: :created
  rescue Exception => e
    error = {'message': e.message}
    json_response error, status: :unprocessable_entity
  end

  def show
    json_response @document_type
  end

  def update
    if @document_type.update(document_type_params)
      json_response @document_type
    else
      json_response @document_type.errors,
                    status: :unprocessable_entity
    end
  end

  private
    def document_type_params
      params.require(:document_type).permit(
          :doc_type, :status, :description
      )
    end

    def set_document_type
      @document_type = DocumentType.find(params[:id])
    rescue
      json_response status: :not_found
    end

end

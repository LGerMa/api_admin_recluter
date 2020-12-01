class Api::V1::BanksController < Api::BaseController
  before_action :set_bank, only: [:show, :update]

  def index
    json_response Bank.all,
                  each_serializer: Api::V1::BankSerializer
  end

  def create
    json_response Bank.create!(bank_params),
                  status: :created
  rescue Exception => e
    error = {'message': e.message}
    json_response error, status: :unprocessable_entity
  end

  def update
    if @bank.update(bank_params)
      json_response @bank
    else
      json_response @bank.errors,
                    status: :unprocessable_entity
    end
  end

  def show
    json_response @bank
  end

  private
    def bank_params
      params.require(:bank).permit(
          :name, :country_id, :status
      )
    end

    def set_bank
      @bank = Bank.find(params[:id])
    rescue
      json_response status: :not_found
    end
end

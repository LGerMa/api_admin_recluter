class Api::V1::CountriesController < Api::BaseController
  before_action :country_params, only: [:create, :update]
  before_action :set_country, only: [:show, :update]

  def index
    json_response Country.all,
                  each_serializer: Api::V1::CountrySerializer
  end

  def create
    json_response Country.create!(country_params),
                  status: :created
  rescue Exception => e
    error = {'message': e.message}
    json_response error, status: :unprocessable_entity
  end

  def update
    if @country.update(country_params)
      json_response @country
    else
      json_response @country.errors,
                    status: :unprocessable_entity
    end
  end

  def show
    json_response @country
  end

  private
    def country_params
      params.require(:country).permit(
          :name, :code, :url_flag, :symbol_currency,
          :currency_type, :dec_currency, :thousand_currency
      )
    end

    def set_country
      @country = Country.find(params[:id])
    rescue
      json_response status: :not_found
    end

end

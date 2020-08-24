class Api::V1::CountriesController < Api::BaseController
  #before_action :country_params, only: [:create, :update]
  before_action :set_country, only: [:show, :update]

  def index
    countries = Country.all()
      #render json: countries, each_serializer: Api::V1::CountrySerializer
    json_response countries, each_serializer: Api::V1::CountrySerializer
  end

  def create
    country = Country.create!(country_params)
    json_response country, serializer: Api::V1::CountrySerializer ,status: :created
  rescue
    json_response country.errors, status: :unprocessable_entity
  end

  def update
    if @country.update(country_params)
      json_response @country
    else
      json_response @country.errors, status: :unprocessable_entity
    end
  end

  def show
    json_response @country, serializer: Api::V1::CountrySerializer
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
    rescue ActiveRecord::RecordNotFound
      json_response [], status: :not_found
    end

end

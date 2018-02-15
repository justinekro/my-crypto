class CryptosController < ApplicationController
  def index
  	@crypto_names = FindCrypto.new.all_crypto
  end

  def create
  	@crypto = params[:crypto]
  	redirect_to search_path(@crypto)
  end

  def search
  	@crypto = params[:crypto]
  	@cryptos = FindCrypto.new.find_value
  end

end

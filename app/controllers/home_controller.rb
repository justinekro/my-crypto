class HomeController < ApplicationController
  def index
  	@crypto_names = FindCrypto.new("test").all_crypto
  end
end

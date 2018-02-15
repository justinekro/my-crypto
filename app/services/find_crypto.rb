require 'open-uri'

class FindCrypto
	def initialize
		@cryptos = Hash.new
		@page_coin = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	end

	def all_crypto
		@crypto_names = @page_coin.css('a[class="currency-name-container"]').take(100).map{|id| id.text.downcase.gsub(" ","-").gsub(".","-")}
	end

	def find_value
		all_crypto		
		@prices = @page_coin.css("a[class=price]").map{|crypto| crypto.text.downcase}
		@cryptos = Hash[@crypto_names.zip(@prices)]
	end
end

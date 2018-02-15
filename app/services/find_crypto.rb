require 'open-uri'

class FindCrypto
	def initialize(crypto)
		@crypto = crypto
		@cryptos = Hash.new
		@page_coin = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	end

	def all_crypto
		@crypto_names = @page_coin.css('a[class="currency-name-container"]').map{|id| id.text.downcase.gsub(" ","-").gsub(".","-")}
	end

	def find_value		
		# On récupère les noms de currency et on les stocke dans un nouveau tableau en les modifiant

		names = page_coin.css('a[class="currency-name-container"]').map{|id| id.text.downcase.gsub(" ","-").gsub(".","-")}

		# Pour chaque nom récupéré on associe le prix correspondant > quelques bugs à cause de l'ID récupéré qui parfois est coupé ou ne correspond pas exactement
		names.each {|result| price = page_coin.xpath('//*[@id="id-' + result + '"]/td[5]/a').text
		crypto[result] = price}

		crypto.each { |cur,price| print "#{cur}: #{price}\n" }

	end
end

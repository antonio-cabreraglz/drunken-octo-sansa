require 'net/https'
require 'json'
require 'uri'
 
class Pagespeed
	def self.test(strategy, domain)
		key = 'AIzaSyDZd5U5F5TeLHVw-0T62RsHERrltuqgXr0'
		 
		 
		url = "https://www.googleapis.com/pagespeedonline/v1/runPagespeed?url=" + \
		      URI.encode(domain) + \
		      "&key=#{key}&strategy=#{strategy}"
		 
		uri = URI.parse(url)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		 
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request)
		 
		pss = JSON.parse(response.body)
    pss['score'].to_i
	end
end
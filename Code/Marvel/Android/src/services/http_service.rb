require 'net/http'
require 'uri'
require 'json/pure'

import 'org.jruby.ext.socket.SocketUtils'
import 'android.os.AsyncTask'

class HttpService
	def get(url, &block)
		HttpGet.new(url, block).execute
	end
end

class HttpGet < AsyncTask
	def initialize(url, block)
		super()

		@uri = URI.parse(url)
		@request = Net::HTTP::Get.new(url)

		@block = block
	end

	def doInBackground(param)
		with_large_stack { 
			response = Net::HTTP.start(@uri.host, @uri.port) { |http| http.request(@request) }

			@json = JSON.parse(response.body)
		}
	end

	def onPostExecute(param)
		@block.call(@json) if @json
	end
end
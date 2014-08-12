class HttpService
	def get(url, &block)
		AFMotion::JSON.get(url) { |result| block.call(result.object) }
	end
end
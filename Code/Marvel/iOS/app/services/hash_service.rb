class HashService
	def MD5(string)
		RmDigest::MD5.hexdigest(string)
	end
end
require 'digest/md5'

class HashService
	def MD5(string)
		digest = Digest::MD5.hexdigest(string)
	end
end
class Marvel
	def initialize(http_service, hash_service)
		@root_url = "http://gateway.marvel.com/v1/public"
		@api_key = "4b3e8f04c699333aa0582ba2ddf82937"
		@private_key = "046da1f6d0df9a39c84123b3445774736bb18475"

		@http_service = http_service
		@hash_service = hash_service
	end


	def find_character(name, &block)
		url = generate_url("characters?nameStartsWith=#{name}")
		@http_service.get(url) do |result|
			characters = result["data"]["results"].map { |json| parse_character(json) }

			block.call(characters)
		end
	end

	def parse_character(json)
		char = Character.new

		char.id = json["id"]
		char.name = json["name"]
		char.description = json["description"]

		if json["thumbnail"]
			path = json["thumbnail"]["path"]
			ext = json["thumbnail"]["extension"]

			char.thumbnail = "#{path}.#{ext}"
		end

		char.comics = parse_detail_items(json["comics"])
		char.series = parse_detail_items(json["series"])
		char.stories = parse_detail_items(json["stories"])
		char.events = parse_detail_items(json["events"])

		char
	end

	def parse_detail_items(json)
		json["items"].map do |itemJson|
			item = CharacterDetailItem.new 
			item.name = itemJson["name"]
			item.resourceURI = itemJson["resourceURI"]

			item
		end
	end

	# scaffolding
	def generate_url(partial_url)
		ts = rand(7919)
		hash = @hash_service.MD5("#{ts}#{@private_key}#{@api_key}")

		"#{@root_url}/#{partial_url}&apikey=#{@api_key}&ts=#{ts}&hash=#{hash}"
	end
end
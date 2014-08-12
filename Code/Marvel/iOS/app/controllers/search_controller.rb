class SearchController < UITableViewController
	def viewDidLoad
		@characters = []
		@images = {}
		@marvel = Marvel.new(HttpService.new, HashService.new)

		searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
	    searchBar.delegate = self;
	    searchBar.showsCancelButton = true;
	    searchBar.sizeToFit

	    view.tableHeaderView = searchBar
	    view.dataSource = self
	    view.delegate = self

	    self.title = "Search For Marvel Characters"
	    self.navigationController.navigationBar.translucent = false
	end

	def load_data(term)
		@marvel.find_character(term) do |result|
			@characters = result

			Dispatch::Queue.main.async do
				view.reloadData
			end
		end
	end

	# table view
	def tableView(tableView, numberOfRowsInSection:section)
		@characters.size
	end

	def tableView(tableView, cellForRowAtIndexPath:indexPath)
		character = @characters[indexPath.row]

		cell = tableView.dequeueReusableCellWithIdentifier("cell") || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: "cell")
		cell.textLabel.text = character.name

		image = @images[character.thumbnail]
		if image
			cell.imageView.image = image
		else
			cell.imageView.image = nil
			AFMotion::Image.get(character.thumbnail) do |result|
				@images[character.thumbnail] = result.object

				Dispatch::Queue.main.async do
					view.reloadData
				end
			end
		end

		cell
	end

	def tableView(tableView, didSelectRowAtIndexPath:indexPath)
		tableView.deselectRowAtIndexPath(indexPath, animated: true)

		detail = DetailController.alloc.init
		detail.character = @characters[indexPath.row]

		self.navigationController.pushViewController(detail, animated: true)
	end

	# search bar
	def searchBarSearchButtonClicked(searchBar)
		searchBar.resignFirstResponder

		load_data(searchBar.text.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding))
	end

	def searchBarCancelButtonClicked(searchBar)
		searchBar.resignFirstResponder
	end
end
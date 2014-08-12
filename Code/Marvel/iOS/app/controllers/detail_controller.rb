class DetailController < UIViewController
  attr_accessor :character

  def viewDidLoad
  	@detailSections = [ "Comics", "Series", "Stories", "Events" ]
  	@details = []

  	build_view
    bind

    segment_change
  end

  # scaffolding
  def build_view
  	self.navigationController.navigationBar.translucent = false
    self.view.backgroundColor = UIColor.whiteColor

    # description label
    @label = UILabel.alloc.initWithFrame(CGRectMake(10,10,300,100))
    @label.textColor = UIColor.blackColor
    @label.numberOfLines = 0

    self.view.addSubview(@label)

    @segment = UISegmentedControl.alloc.initWithItems(@detailSections)
    @segment.selectedSegmentIndex = 0
    @segment.addTarget(self, action: 'segment_change', forControlEvents: UIControlEventValueChanged)

    self.view.addSubview(@segment)

    @table = UITableView.alloc.initWithFrame(CGRectZero, style: UITableViewStylePlain)
    @table.dataSource = self

    self.view.addSubview(@table)
  end

  def bind
    self.title = @character.name

    @label.text = @character.description || "No Description Found"
    @label.sizeToFit

    @segment.frame = CGRectMake(10, @label.frame.size.height + 20, 300, @segment.frame.size.height)

    top = @segment.frame.origin.y + @segment.frame.size.height + 10
    @table.frame = CGRectMake(10, top, 300, self.view.frame.size.height - top - 5)
  end

  def segment_change
  	@details = @character.send(@detailSections[@segment.selectedSegmentIndex].downcase)

    @table.reloadData
  end

  # tableview
  def tableView(tableView, numberOfRowsInSection:section)
    @details.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    detail = @details[indexPath.row]

    cell = tableView.dequeueReusableCellWithIdentifier("cell") || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: "cell")
    cell.textLabel.text = detail.name

    cell
  end

end
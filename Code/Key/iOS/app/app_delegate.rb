class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

  	AFMotion::HTTP.get("http://google.com") do |result|
	  p result.body
	end

    true
  end
end

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions) 
    	@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
	@window.makeKeyAndVisible

	@window.rootViewController = WebViewController.alloc.init

    true
  end
end

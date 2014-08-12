class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

  	@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.applicationFrame)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(SearchController.alloc.initWithStyle(UITableViewStylePlain))
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    true
  end
end

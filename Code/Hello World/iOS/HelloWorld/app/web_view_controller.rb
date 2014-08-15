class WebViewController < UIViewController
   def viewDidLoad
    @webView = UIWebView.alloc.initWithFrame(self.view.bounds)
    self.view.addSubview(@webView)

    load_data
  end

  def load_data
    url = NSURL.URLWithString("http://www.thatconference.com")
    request = NSURLRequest.requestWithURL(url, cachePolicy: NSURLRequestReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)

    @webView.loadRequest(request)
  end
end
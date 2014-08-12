RubyMotion
==================
Hello World
------------------

```
motion create HelloWorld
```

1. show folder structure
2. open app delegate - puts Hello World
3. show repl - puts Hello ThatConference

Basic Web Demo
-------------------

### Command
```
motion create BasicWebDemo
```

### Create View Controller File

1. web_view_controller.rb

```
class WebViewController < UIViewController
end
```

#### App Delegate 

```
	@window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
	@window.makeKeyAndVisible

	@window.rootViewController = WebViewController.alloc.init
```

#### Add Web View

```
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
```

Marvel App
------------------

1. Look at Folders
2. Look at rake file
3. Walk through Code

JRuby / Ruboto
===================
Hello World
-------------------

1. Create App

```
ruboto gen app --package com.gretz.helloworld --name HelloWorld --target android-18
```


Basic App Demo
---------------

1. Create App

```
ruboto gen app --package com.gretz.BasicAppDemo --name BasicApp --target android-18
```

2. Code

```
import "android.content.Intent"
import "android.net.Uri"

class BasicAppActivity
  def on_create(bundle)
    super
  end

  def on_resume
    super
    intent = Intent.new(Intent::ACTION_VIEW)

    intent.setData(Uri.parse("http://www.thatconference.org/"))
    startActivity(intent)
    finish
  end
end
```

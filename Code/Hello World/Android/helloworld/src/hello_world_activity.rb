import "android.content.Intent"
import "android.net.Uri"

class HelloWorldActivity
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
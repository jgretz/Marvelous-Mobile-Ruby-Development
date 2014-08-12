require 'ruboto/widget'
require 'ruboto/util/toast'
require 'ruboto/util/stack'

require 'Shared/models/character'
require 'Shared/models/character_detail_item'
require 'Shared/services/marvel'

require 'services/hash_service'
require 'services/http_service'

import "android.widget.ArrayAdapter"
import "android.view.inputmethod.InputMethodManager"

ruboto_import_widgets :Button, :LinearLayout, :TextView, :EditText, :ListView

class MarvelousActivity
  def onCreate(bundle)
    super

    # service
    @marvel = Marvel.new HttpService.new, HashService.new

    # UI
    set_title 'Marvelous'

    self.content_view =
        linear_layout :orientation => :vertical do
          @edit = edit_text :text => '',
                            :layout => {:width => :match_parent},
                            :id => 44

          button :text => 'Search', 
                 :layout => {:width => :match_parent},
                 :id => 43, :on_click_listener => proc { search }

          @resultView = list_view :layout => {:width => :match_parent},
                                  :id => 45

        end
  rescue Exception
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end

  private

  def search
    # hide keyboard
    imm = self.getApplicationContext.getSystemService(Context::INPUT_METHOD_SERVICE)
    imm.toggleSoftInput(InputMethodManager::HIDE_IMPLICIT_ONLY,0) 

    # search
    @marvel.find_character(@edit.text) do |results|
      list = results.map { |c| c.name }

      @resultView.adapter = ArrayAdapter.new(self, R::layout::simple_list_item_1, list)
    end
  end

end


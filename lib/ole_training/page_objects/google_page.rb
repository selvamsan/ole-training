

class GooglePage < BasePage

  page_url "http://www.google.com/"

  element(:search_box)            {|b| b.text_field(:id => 'gbqfq')}
  action(:search)                 {|val,b| b.search_box.when_present.set(val)}
end

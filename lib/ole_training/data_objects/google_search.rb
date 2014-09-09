

class GoogleSearch < DataFactory

  def initialize(browser,opts = {})
    @browser = browser
    defaults = {
      :term => 'google'
    }
    set_options(defaults.merge(opts)) # This creates @term as an instance variable.
  end

  def start
    visit GooglePage do |page|
      # Pass @term as an argument to the search action on the Google Page.
    end
  end

  def found?(term)
    on ResultsPage do |page|
      if page.results_exist?(term)
        return true
      else
        return false
      end
    end
  end

end

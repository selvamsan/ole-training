

class GoogleSearch < DataFactory

  def initialize(browser,opts = {})
    @browser = browser
    defaults = {
      :term => 'google'
    }
    set_options(defaults.merge(opts))
  end

  def start
    visit GooglePage do |page|
      # Call the search action on the Google Page with @term as an argument
      #   to perform a Google search.
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

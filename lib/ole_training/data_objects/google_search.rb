

class GoogleSearch < DataFactory

  def initialize(browser,opts = {})
    @browser = browser
    defaults = {
      :term => 'google'
    }
    set_options(defaults.merge(opts)) # This creates @term as an instance variable.
    # The variable @term will have the value declared in defaults,
    # unless a value is given at instantiation.
  end

  def start
    visit GooglePage do |page|
      # Call page.search with @term as an argument to set the
      # value of the Google search box once it is present.
      # Search is an action defined in:
      #   lib/ole_training/page_objects/google_page.rb line 8
      # The search box element is defined in:
      #   lib/ole_training/page_objects/google_page.rb line 7
      page.search(@term)
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

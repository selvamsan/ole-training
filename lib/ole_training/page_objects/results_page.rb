

class ResultsPage < BasePage

  element(:results)           {|which,b| b.h3(:class => 'r').a(:text => /#{which}/) }
  value(:results_exist?)      {|which,b| b.results(which).present? }
end

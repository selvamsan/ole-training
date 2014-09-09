

class ResultsPage < BasePage

  element(:result_stats)      {|b| b.div(:id => 'resultStats')}
  element(:results)           {|which,b| b.h3(:class => 'r').a(:text => /#{which}/) }
  value(:results_exist?)      {|which,b| b.result_stats.wait_until_present ; b.results(which).present? }
end

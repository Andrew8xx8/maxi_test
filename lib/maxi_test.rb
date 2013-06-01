require "maxi_test/version"
require "pry"
require "active_support/core_ext/string/inflections"

module MaxiTest
  autoload 'TestCase', 'maxi_test/test_case'
  autoload 'TestRunner', 'maxi_test/test_runner'
  autoload 'TestResult', 'maxi_test/test_result'
  autoload 'TestResultsCollection', 'maxi_test/test_results_collection'
  autoload 'TestFormatter', 'maxi_test/test_formatter'

  class << self
    def run
      reporter = MaxiTest::TestResultsCollection.new

      result = MaxiTest::TestRunner.run(reporter)
    end
  end
end

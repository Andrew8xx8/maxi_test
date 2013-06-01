require "maxi_test/version"
require "pry"
require "active_support/core_ext/string/inflections"

module MaxiTest
  autoload 'TestCase', 'maxi_test/test_case'
  autoload 'TestRunner', 'maxi_test/test_runner'
  autoload 'TestResult', 'maxi_test/test_result'
  autoload 'TestReporter', 'maxi_test/test_reporter'
  autoload 'TestFormatter', 'maxi_test/test_formatter'

  class << self
    def run
      reporter = MaxiTest::TestReporter.new

      result = MaxiTest::TestRunner.run(reporter)
    end
  end
end

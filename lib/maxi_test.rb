require "maxi_test/version"
require "pry"
require "active_support/core_ext/string/inflections"

module MaxiTest
  autoload 'TestCase', 'maxi_test/test_case'
  autoload 'TestRunner', 'maxi_test/test_runner'
  autoload 'TestResult', 'maxi_test/test_result'
  autoload 'TestReporter', 'maxi_test/test_reporter'
  autoload 'TestFormatter', 'maxi_test/test_formatter'
  autoload 'Ioc', 'maxi_test/ioc'

  class ServiceNotFound < RuntimeError; end
  class AssertionFailed < RuntimeError; end

  class << self
    def ioc
      @ioc ||= Ioc.new
    end

    def run
      reporter = ioc.get(:test_reporter).new

      result = MaxiTest::TestRunner.run(reporter)

      ioc.get(:test_formatter).print_summary(reporter)
    end

    def register_test_result(klass)
      @ioc.set(:test_result, klass)
    end

    def register_reprter(klass)
      @ioc.set(:test_reporter, klass)
    end

    def register_formatter(klass)
      @ioc.set(:test_formatter, klass)
    end
  end
end

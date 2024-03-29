class MaxiTest::TestRunner
  class << self
    def add_test(klass, name)
      @tests ||= []
      @tests << {
        klass: klass,
        name: name
      }
    end

    def run(reporter)

      @tests.each do |test_case|
        test = test_case[:klass].constantize.new

        result = test.run(test_case[:name])

        reporter.add_result(result)

        MaxiTest.ioc.get(:test_formatter).print_result(result)
      end

      reporter
    end
  end
end

class MaxiTest::TestRunner
  class << self
    def add_test(klass, name)
      @tests ||= []
      @tests << {
        klass: klass,
        name: name
      }
    end

    def run
      results = MaxiTest::TestResultsCollection.new

      @tests.each do |test_case|
        test = test_case[:klass].constantize.new

        test.send(test_case[:name])

        result = MaxiTest::TestResult.new(test_case[:klass], test_case[:name], test.assertions)

        results.add_result(result)

        MaxiTest::TestFormatter.print_result(result)
      end

      results
    end
  end
end

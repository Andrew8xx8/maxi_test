class MaxiTest::TestFormatter
  class << self
    def print_assertion(assertion)
      assertion ? '.' : 'F'
    end

    def print_result(result)
      puts "#{format_result(result.passed?)}: #{result.klass} #{result.test}"
      result.assertions.each do

      end
    end

    def print_summary(reporter)
      print_failed_tests(reporter)
      puts "\n"
      puts "Total test: #{reporter.all_tests.count}; Passed tests: #{reporter.passed_tests.count}; Failed tests: #{reporter.failed_tests.count}"
      puts "Total asserts: #{reporter.all_asserts.count}; Passed asserts: #{reporter.passed_asserts.count}; Failed asserts: #{reporter.failed_asserts.count}"
    end

    def format_result(result)
      result ? "PASSED" : "FAILED"
    end

    def print_failed_tests(reporter)
      reporter.failed_tests.each do |result|
        puts "#{result.klass} #{result.test}:"
        puts "\t #{result.exception}"
      end
    end


  end
end

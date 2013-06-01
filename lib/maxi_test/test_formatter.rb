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
      puts "\nFailed tests:"

      reporter.failed_tests.each do |result|
        puts format_test(result)
      end
    end

    def format_test(result)
       puts "\n\t#{result.klass} #{result.test}:"
       if result.exception.instance_of?(MaxiTest::AssertionFailed)
         puts "\t\t Assert failed"
         puts "\t\t Raised: #{result.exception}"
       else
         puts "\t\t Raised: #{result.exception}"
         puts "\t\t #{result.exception.backtrace.join("\n\t\t")}"
       end
    end
  end
end

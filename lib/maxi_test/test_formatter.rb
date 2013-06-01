class MaxiTest::TestFormatter
  class << self
    def print_assertion(assertion)
      assertion ? '.' : 'F'
    end

    def print_result(result)
      puts "#{format_result(result.result)}: #{result.klass} #{result.test}"
      result.assertions.each do

      end
    end

    def print_summary(reporter)
      puts "All test: #{reporter.total_tests}; Passed tests: #{reporter.passed_tests}; Failed tests: #{reporter.failed_tests}"
      puts "All asserts: #{reporter.total_asserts}; Passed asserts: #{reporter.passed_asserts}; Failed asserts: #{reporter.failed_asserts}"
    end

    def format_result(result)
      result ? "PASSED" : "FAILED"
    end

  end
end

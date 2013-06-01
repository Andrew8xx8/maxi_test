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

    def print_summary(result)

    end

    def format_result(result)
      result ? "PASSED" : "FAILED"
    end
  end
end

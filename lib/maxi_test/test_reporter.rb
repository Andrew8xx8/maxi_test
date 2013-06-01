class MaxiTest::TestReporter
  def initialize
    @results = []
  end

  def add_result(result)
    @results << result
  end

  def failed_tests
    @results.inject(0) {|count, result| count += 1 unless result.result }
  end


  def passed_tests
    @results.inject(0) {|count, result| count += 1 if result.result }
  end

  def total_tests
    @results.size
  end

  def passed_asserts
    @results.inject(0) {|count, result| count += result.passed_asserts }
  end

  def failed_asserts
    @results.inject(0) {|count, result| count += result.failed_asserts }
  end

  def total_asserts
    @results.
  end
end

class MaxiTest::TestReporter
  def initialize
    @results = []
  end

  def add_result(result)
    @results << result
  end

  def failed_tests
    @results.find_all {|result| result.failed? }
  end

  def passed_tests
    @results.find_all {|result| result.passed? }
  end

  def all_tests
    @results
  end

  def passed_asserts
    @results.inject([]) {|all, result| all + result.passed_asserts }
  end

  def failed_asserts
    @results.inject([]) {|all, result| all + result.failed_asserts }
  end

  def all_asserts
    @results.inject([]) {|all, result| all + result.all_asserts }
  end
end

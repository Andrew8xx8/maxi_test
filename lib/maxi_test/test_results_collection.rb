class MaxiTest::TestResultsCollection
  def initialize
    @results = []
  end

  def add_result(result)
    @results << result
  end
end

class MaxiTest::TestResult
  attr_reader :klass, :test, :assertions

  def initialize(klass, test, assertions)
    @klass = klass
    @test = test
    @assertions = assertions
  end

  def passed?
    result
  end

  def failed?
    !result
  end

  def failed_asserts
    @assertions.reject {|a| a}
  end

  def passed_asserts
    @assertions.find_all {|a| a}
  end

  def all_asserts
    @assertions
  end

  private

  def result
    @assertions.reduce(:&)
  end
end

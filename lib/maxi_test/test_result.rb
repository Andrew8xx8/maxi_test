class MaxiTest::TestResult
  attr_reader :klass, :test, :assertions, :exception

  def initialize(klass, test, assertions, exception = nil)
    @klass = klass
    @test = test
    @assertions = assertions
    @exception = exception
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
    @assertions.reduce(:&) & @exception.nil?
  end
end

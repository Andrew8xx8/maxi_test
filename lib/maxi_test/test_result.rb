class MaxiTest::TestResult
  attr_reader :klass, :test, :assertions

  def initialize(klass, test, assertions)
    @klass = klass
    @test = test
    @assertions = assertions
  end

  def result
    @assertions.reduce(:&)
  end

  def failed_asserts
    @assertions.inject(0) {|count, assert| count += 1 unless assert}
  end

  def passed_asserts
    @assertions.inject(0) {|count, assert| count += 1 if assert}
  end

  def total_asserts
    @assertions.size
  end
end

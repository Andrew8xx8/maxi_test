class MaxiTest::TestResult
  attr_reader :klass, :test, :assertions

  def initialize(klass, test, assertions)
    @klass = klass
    @test = test
    @assertions = assertions
  end

  def result
    result = true
    @assertions.inject(true) { |r, v| r = r && v }
  end
end

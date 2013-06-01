class MaxiTest::TestCase
  attr_reader :assertions

  def initialize
    @assertions = []
  end

  def run(name)
    send(name)

    MaxiTest.ioc.get(:test_result).new(self.class.name, name, @assertions)
  rescue Exception => e
    MaxiTest.ioc.get(:test_result).new(self.class.name, name, [], e)
  end

  def assert(value)
    result = value && true
    raise(MaxiTest::AssertionFailed, )unless result

    @assertions << result
  end

  class << self
    def method_added(name)
      MaxiTest::TestRunner.add_test(self.name, name)
    end
  end
end

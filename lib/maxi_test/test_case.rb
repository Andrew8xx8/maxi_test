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

  def method_missing(name, *args)
    if MaxiTest::Assertions.have_assert?(name)
      @assertions << MaxiTest::Assertions.run(name, *args)

      raise(MaxiTest::AssertionFailed, @assertions.last.error_message) if @assertions.last.failed?
    end
  end

  class << self
    def method_added(name)
      MaxiTest::TestRunner.add_test(self.name, name)
    end
  end
end

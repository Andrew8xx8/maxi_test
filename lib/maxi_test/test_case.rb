class MaxiTest::TestCase
  attr_reader :assertions

  def initialize
    @assertions = []
  end

  def run(name)
    send(name)

    MaxiTest.ioc.get(:test_result).new(self.class.name, name, @assertions)
  rescue Exception => e
    MaxiTest.ioc.get(:test_result).new(self.class.name, name, [], e.backtrace.join("\n\t"))
  end

  def assert(value)
    @assertions << value && true
  end

  class << self
    def method_added(name)
      MaxiTest::TestRunner.add_test(self.name, name)
    end
  end
end

class MaxiTest::TestCase
  attr_reader :assertions

  def initialize
    @assertions = []
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

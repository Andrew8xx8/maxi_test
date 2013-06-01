class MaxiTest::Ioc
  def initialize
    @services = {}

    set(:test_result, MaxiTest::TestResult)
    set(:test_reporter, MaxiTest::TestReporter)
    set(:test_formatter, MaxiTest::TestFormatter)
  end

  def set(name, klass)
    @services[name] = klass
  end

  def get(name)
    raise MaxiTest::ServiceNotFound unless @services.has_key?(name)

    @services[name]
  end
end

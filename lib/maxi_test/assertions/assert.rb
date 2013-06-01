class MaxiTest::Assertions::Assert
  def initialize
    @result = false
  end

  def passed?
    @result
  end

  def failed?
    !@result
  end

  def exec(value)
    @result = value && true
  end

  def error_message
    "Shoud be true got #{@result}"
  end
end

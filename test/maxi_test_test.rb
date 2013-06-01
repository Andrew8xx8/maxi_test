require 'maxi_test/test_helper'

class MaxiTestTest < MaxiTest::TestCase
  def test_assert_true
    assert true
  end

  def test_assert_false
    assert false
  end

  def test_raise_exception
    raise Exception
  end
end

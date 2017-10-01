require 'test_helper'

class TimeOfDayTest < Minitest::Test

  def test_time_of_day_parser
    # assert_time_equal 10,0, 0 , TimeOfDay.parse('10')
    # assert_time_equal 10,32,0 , TimeOfDay.parse('10:32')
    assert_time_equal 23,59,59, TimeOfDay.parse('23:59:59')
  end

  def test_inspect
    assert_equal '11:12:00', TimeOfDay.parse('11:12').inspect
  end

  private

  def assert_time_equal(hour, minute, second, time)
    assert_equal hour,   time.hour
    assert_equal minute, time.minute
    assert_equal second, time.second
  end
end

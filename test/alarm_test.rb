require 'test_helper'

class AlarmTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Alarm::VERSION
  end
end

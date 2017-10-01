class TimeOfDay
  attr_accessor :hour, :minute, :second
  
  def initialize(hour, minute = 0, second = 0)
    @hour = hour
    @minute = minute || 0
    @second = second || 0
  end

  def inspect
    "%.2d:%.2d:%.2d" % [@hour,@minute,@second]
  end
  
  def self.parse(str)
    optional = '(?::(\d{1,2}))?'

    if str =~ /(\d{1,2})#{optional}#{optional}/
      hour   = $1.to_i
      minute = $2.to_i unless $2.nil?
      second = $3.to_i unless $3.nil?
      TimeOfDay.new(hour,minute,second)
    else
      fail "Time format is HH:MM:SS. Seconds and minutes are optional."
    end
  end
end

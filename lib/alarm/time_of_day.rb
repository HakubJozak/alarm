class TimeOfDay
  attr_accessor :hour, :minute

  def initialize(hour, minute = 0)
    @hour = hour
    @minute = minute || 0
  end

  def to_s
    "%.2d:%.2d" % [ @hour, @minute]
  end

  def to_cron
    "#{@minute} #{@hour} * * *"
  end

  def self.parse(str)
    optional = '(?::(\d{1,2}))?'

    if str =~ /(\d{1,2})#{optional}#{optional}/
      hour   = $1.to_i
      minute = $2.to_i unless $2.nil?
      TimeOfDay.new(hour,minute)
    else
      raise Alarm::Error.new("Time format is HH:MM. Minutes are optional.")
    end
  end
end

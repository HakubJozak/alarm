require 'date'
require 'alarm/scheduler'


module Alarm
  class Cli
    def initialize(args)
      @command   = args.first
      @scheduler = Alarm::Scheduler.new
    end

    def run
      case @command
      when '-d'
        @scheduler.cancel_alarm
        puts "Alarm cancelled."
      else
        moment = TimeOfDay.parse(@command || '')
        wake_up_computer_before_alarm(moment)
        @scheduler.set_alarm(moment)
        puts "Alarm set for #{moment}."
      end
    rescue Alarm::Error
      puts $!.message
    end

    private

    def wake_up_computer_before_alarm(moment)
      a_minute_earlier = moment - 1.minute
      str = a_minute_earlier.strftime("%Y-%m-%d %H:%M")
      cmd = "rtcwake -v --date #{str} -m no -u"
      puts cmd
      system cmd
    end    

  end
end

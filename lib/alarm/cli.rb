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
        time = TimeOfDay.parse(@command || '')
        puts "Alarm set for #{time}."
        @scheduler.set_alarm(time)

      end
    rescue Alarm::Error
      puts $!.message
    end
  end
end

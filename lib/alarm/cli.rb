require 'date'

module Alarm
  class Cli
    def initialize(args)
      @command = args.first
    end

    def run
      case @command
      when '-d'
        puts "Alarm cancelled."        
      else
        @time = TimeOfDay.parse(@command || '')
        puts "Alarm set for #{@time}."        
      end
    rescue Alarm::Error
      puts $!.message
    end
  end
end

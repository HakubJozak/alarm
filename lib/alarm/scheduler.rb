require 'whenever'

module Alarm
  class Scheduler < ::Whenever::CommandLine
    def initialize
      @options = {
        identifier: 'alarm',
        user: 'jakub',
        cut: 0
      }
    end

    def cancel_alarm
      @options[:clear] = true
      write_crontab(updated_crontab)
    end

    def set_alarm(time)
      @options[:update] = true
      @options[:string] = alarm_cron_string(time)
      write_crontab(updated_crontab)
    end

    private

    def alarm_command
      'ogg123 "/home/jakub/Music/alarm.ogg"'
    end

    def alarm_cron_string(time)
      %{ every '#{time.to_cron}' do
          command '#{alarm_command}'
         end }        
    end
    
    # public :write_crontab
    # public :updated_crontab    
  end


  # class Scheduler
  #   def initialize
      
      
  #   end

  #   def set_alarm
  #     whenever(update: true, string: 'blabla')
  #   end

  #   def remote_alarm
  #     whenever(clear: true)
  #   end

  #   private

  #   def whenever(opts)
  #     Alarm::W
  #   end
end

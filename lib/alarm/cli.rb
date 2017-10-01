require 'date'

module Alarm
  class Cli
    def initialize(args)
      # TODO parse date manually or use Thor
      TimeOfDay.parse
    end


  end
end

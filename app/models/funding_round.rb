require_relative 'startup.rb'
require 'pry'

class FundingRound
    
    attr_reader :startup, :vc, :type, :investment

    @@all = [ ]

    def self.all
        @@all
    end

    def initialize(startup, vc, type, investment)
        @startup = startup
        @vc = vc
        @type = type
        @investment = investment.to_f
        @@all << self
    end
end

#binding.pry

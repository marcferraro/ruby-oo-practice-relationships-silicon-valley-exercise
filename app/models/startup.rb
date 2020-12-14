require_relative 'venture_capitalist.rb'
require_relative 'funding_round.rb'
require 'pry'

class Startup
    attr_accessor :name, :domain
    attr_reader :founder

    @@startups = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@startups << self
    end

    def pivot(new_name, new_domain)
        self.name = new_name
        self.domain = new_domain
        self
    end

    def self.all
        @@startups
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        array = []
        array = self.all.map {|startup| startup.domain}
        array.uniq
    end

    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.count {|funding_round| funding_round.startup.name == self.name}
    end

    def total_funds
        count = FundingRound.all.select {|funding_round| funding_round.startup == self}
        count.sum {|startup| startup.investment}
    end

    def investors
        startup_array = FundingRound.all.select {|funding_round| funding_round.startup == self}
        vc_array = startup_array.map {|startup| startup.vc}
        vc_array.uniq
    end

    def big_investors
        startup_array = FundingRound.all.select {|funding_round| funding_round.startup == self}
        vc_array = startup_array.map {|startup| startup.vc}
            array = VentureCapitalist.tres_commas_club.each do |tcc|
                vc_array.each select |vc| 
                    tcc == vc
            end
        array
    end
    
end

#binding.pry

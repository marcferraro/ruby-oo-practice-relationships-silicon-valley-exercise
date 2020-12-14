require 'pry'

class VentureCapitalist
    attr_reader :name, :total_worth

    @@vc = []

    def initialize(name, worth)
        @name = name
        @total_worth = worth
        @@vc << self
    end

    def self.all
        @@vc
    end

    def self.tres_commas_club
       array = self.all.select do|vc| 
       vc.total_worth > 1000000000
       end
       array
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|funding_round| funding_round.vc == self}
    end

    def portfolio
        funded_rounds = self.funding_rounds
        funded_startups = funded_rounds.select {|funding_round| funding_round.startup}
        funded_startups.uniq
    end

    def biggest_investment
        funded_rounds = self.funding_rounds.map {|funding_round| funding_round.investment}
        funded_rounds.max
    end

    def invested(domain)
        invested_domains = self.funding_rounds.select do |funding_round| 
            funding_round.startup.domain == domain
        end
        individual_investments = invested_domains.map do |domain|
            domain.investment
        end
        individual_investments.sum
    end
end
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
end

apple = Startup.new("Apple", "Evan", "Apples")
live_fast_die_die = Startup.new("live fast", "Marc", "Stuff")

binding.pry
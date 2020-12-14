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
        #binding.pry
       array = self.all.select do|vc| 
       # binding.pry
        vc.total_worth > 1000000000
       end
       array
    end
end


marc = VentureCapitalist.new("Marc", 1000)
#VentureCapitalist.tres_commas_club
binding.pry
1
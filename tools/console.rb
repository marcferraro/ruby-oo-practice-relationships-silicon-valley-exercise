require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

require 'pry'

marc = VentureCapitalist.new("Marc", 1000)
abe = VentureCapitalist.new("Abe", 100000)
mary = VentureCapitalist.new("Mary", 104000)
apple = Startup.new("Apple", "Evan", "Apples")
orange = Startup.new("Orange", "Smorange", "Oranges")


orange.sign_contract(abe, "Angel", 500)
orange.sign_contract(abe, "Angel", 400)
a = FundingRound.new(apple, abe, "Angel", 200)
live_fast_die_young = Startup.new("live fast", "Marc", "Stuff")
apple.sign_contract(abe, "Angel", 500)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
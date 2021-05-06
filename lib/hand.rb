class Hand
	def initialize(game_answer)
		self.deal_hand(game_answer)
	end
	
	def deal_hand(game_answer)
		if game_answer.downcase == "yes"
			#creates 5 players, possible modification would be to allow users to 
			#add new players by name
			players = []
			(1..5).to_a.map {|num| "Player " + num.to_s}.each do |player|
				players << Player.new(player)
			end
			#creates new deck
			deck = Deck.new()
			#creates new card game
			game = Game.new(deck, players)
			#deals 4 cards, in the future could easily add another prompt that asks the number of cards
			game.deal_cards(2)
			#calculates the score of the game
			game.calculate_score
			puts "The winner is #{game.winner.name} with a hand of #{game.winner.score}"
			puts game.players.sort_by {|n| -n.score}.map {|x| "#{x.name} - score: #{x.score} - hand: #{x.hand.map {|z| z.join(" ")}.join(",")}"}
			puts "Would you like to start a new game, Yes/No"
			self.deal_hand(gets.chomp)
		else
			puts "Game not started, please try again"
		end
	end
end
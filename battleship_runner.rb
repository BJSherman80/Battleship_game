require "./lib/ship"
require "./lib/cell"
require "./lib/board"
require "./lib/player"
require "./lib/game"

board2 = Board.new
player2 = Player.new("Batman", board2)
cruiser = Ship.new("cruiser", 3)
submarine = Ship.new("submarine", 2)
board1 = Board.new
player1 = Player.new("Gandalf", board1)


game = Game.new(player1, player2)

game.play_game

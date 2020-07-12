require "lib"

p "Welcome to Battleship!"
p "Enter p to play. Enter q to quit. "
a = gets.chomp

loop do
if a == "p"
  break
elsif a == "q"

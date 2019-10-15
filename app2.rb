require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "----------------------------------------"
puts "|        Bienvenue sur ce jeu           |"
puts "| Le but sera de battre tes adversaires |"
puts "----------------------------------------"

puts "Enregistre ton prénom :"
prenom = gets.chomp

player1 = Player.new("Josianne")
player2 = Player.new("José")
user = HumanPlayer.new("#{prenom}")

ennemies = []
ennemies << player1
ennemies << player2

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  
  puts "   "
  
  puts "Voici les POINT DE VIE des joueurs : "
  player1.show_state
  player2.show_state
  user.show_state
  
  puts "   "
  
  puts "Quelle action veux tu effectuer ?"
  puts "   "
  puts "  Tape A si tu veux chercher une meilleure arme"
  puts "  Tape S si tu veux chercher un pack de vie"
  puts "   "
  puts "Si tu souhaites plutôt attaquer un joueur :"
  puts "   "
  if player1.life_points >0
  puts "  Tape 0 si tu veux attaquer #{player1.name} qui a #{player1.life_points} points de vie"
  else 
    puts "  X  #{player1.name} est déjà mort"
  end
  if player2.life_points > 0
  puts "  Tape 1 si tu veux attaquer #{player2.name} qui a #{player2.life_points} points de vie"
  else
    puts "  X  #{player2.name} est déjà mort"
  end
  choice = gets.chomp
  
  if choice == "a"
    user.search_weapon
  elsif choice == "s"
    user.search_health_pack
  elsif choice == "0"
    user.attacks(player1)
  elsif choice == "1"
    user.attacks(player2)
  end
  
  puts "   "
  
  puts "**C'est aux autres joueurs de t'attaquer. Appuie sur ENTRER pour continuer**"
  gets.chomp
  ennemies.each do |ennemi|
    if ennemi.life_points > 0
    ennemi.attacks(user)
    else 
      puts "#{ennemi.name} est mort(e), il/elle ne peut pas attaquer"
    end
  end
  
  puts "   "
  puts "**Le tour est fini appuie sur ENTRER pour continuer**"
  gets.chomp
  puts "   "
  puts "---------------- NOUVEAU TOUR ----------------"
  
end
  
puts "La partie est finie"

if user.life_points <= 0 
  puts "Dommage, tu as perdu ! "
else 
  puts "BRAVO tu as gagné ! "
end
  


binding.pry

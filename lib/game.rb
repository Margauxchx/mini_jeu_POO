require 'pry'
require_relative 'player'

class Game
  attr_accessor :human_player, :enemies
 
  def initialize (human_player)
    @human_player = HumanPlayer.new(human_player)
    @enemies = [Player.new("José"), Player.new("Josephine"), Player.new("Josette"), Player.new("Joseph")]
  end
  
  def kill_player 
    @enemies.each do |enemie|
      if enemie.life_points <= 0
        @enemies.delete(enemie)
      end
    end
  end
  
  def is_still_ongoing?
    if @human_player.life_points > 0 && !@enemies.empty?
      return true
    else
      return false
      puts "Le jeu est terminé"
    end
  end
  
  def show_players
    
    @human_player.show_state
    puts "Il reste #{@enemies.count} ennemis en jeu."
    
  end
  
  
  def menu
    puts "   "
  
    puts "Quelle action veux tu effectuer ?"
    puts "   "
    puts "  Tape A si tu veux chercher une meilleure arme"
    puts "  Tape S si tu veux chercher un pack de vie"
    puts "   "
    puts "Si tu souhaites plutôt attaquer un joueur :"
    puts "   "
    i = 0
    @enemies.each do |enemie|
      if enemie.life_points > 0
        puts "  Tape #{i} si tu souhaite attaquer #{enemie.name} avec #{enemie.life_points} points de vie "
        i += 1
      end
    end
  end
  
  
  def menu_choice
    choice = gets.chomp
    if choice == "a"
      human_player.search_weapon
    elsif choice == "s"
      human_player.search_health_pack
    elsif choice == "0" || choice == "1" || choice == "2" || choice == "3"
      position = choice.to_i
       if position <= @enemies.count-1 
        if @enemies[position].life_points > 0
          @human_player.attacks(enemies[position])
          kill_player
        end
       else 
         puts "Tape un chiffre entre 0 et 3 stp"
       end
    else 
      puts "Mauvaise saisie, tape a, s ou un chiffre entre 0 et 3"
    end
  end
  
  def enemies_attack
    puts "  "
    puts "**C'est aux autres joueurs de t'attaquer. Appuie sur ENTRER pour continuer**"
    gets.chomp
    enemies.each do |enemi|
      if enemi.life_points > 0
        enemi.attacks(@human_player)
      else 
        puts "#{ennemi.name} est mort(e), il/elle ne peut pas attaquer"
      end
    end
  end
        
  def final
    puts "   "
    puts "**Le tour est fini appuie sur ENTRER pour continuer**"
    gets.chomp
    puts " ********************  "
    puts "La partie est finie"

    if user.life_points <= 0 
      puts "Dommage, tu as perdu ! "
    else 
      puts "BRAVO tu as gagné ! "
    end
    puts "********************"
  end
end
      
    
  
  



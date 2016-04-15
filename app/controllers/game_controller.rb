class GameController < ApplicationController

  def index
    @players = ['Mikey', 'Robin', 'Jacob', 'Rebecca', 'Julian', 'Yvonne', 
                'Christine', 'Gina', 'Jim', 'Hilarie']
                
    @holes = ['Putt-Pong','Putt R. Mutt', 'Guess What? Chicken Putt!',
              'Snake Bite!','Right on Cue','Stargazer','Take It to the Grave',
              'Move Your Hole!','The Uncertainty Principle']
  end
end

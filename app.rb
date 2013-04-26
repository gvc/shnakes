require 'shnakes/game_engine'

module Shnakes
  WIDTH = 450
  HEIGHT = 400

  Shoes.app title: 'SHNAKES!', width: WIDTH, height: HEIGHT do
    def restart_game
      @engine.cleanup
      @engine = GameEngine.new(self, @debug)
      @clock.start
    end

    def update_score(new_score)
      @score.replace "Score #{new_score}"
    end

    @score = para "Score #{0}", stroke: red, align: :center, width: 1.0
    @engine = GameEngine.new(self, @debug)

    @clock = animate(20) do
      @engine.tick(@clock)
    end

    keypress do |key|
      case key
        when 'p' then @clock.stop
        when 'r' then @clock.start
        when 'n' then restart_game
        when 'q' then quit
      else
        @engine.change_direction(key) if [:up, :right, :left, :down].include?(key)
      end
    end
  end
end

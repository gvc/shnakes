require 'shnakes/game_engine'

module Shnakes
  WIDTH = 450
  HEIGHT = 400

  Shoes.app title: 'SHNAKES!', width: WIDTH, height: HEIGHT do

    @debug = para "NO KEY is PRESSED."
    @engine = GameEngine.new(self, @debug)

    @clock = animate(24) do
      @engine.tick(@clock)
    end

    keypress do |key|
      case key
        when 'p' then @clock.stop
        when 'r' then @clock.start
        when 'q' then quit
      else
        @engine.change_direction(key) if [:up, :right, :left, :down].include?(key)
      end
    end
  end
end

require 'shnakes/game_engine'

module Shnakes
  WIDTH = 450
  HEIGHT = 400

  Shoes.app title: 'SHNAKES!', width: WIDTH, height: HEIGHT do

    @debug = para "NO KEY is PRESSED."
    @square = rect(top: 195, left: 220, width: 10, height: 10, center: false)
    @engine = GameEngine.new(self, @square, @debug)

    @clock = animate(24) do
      @engine.tick(@clock)
    end

    keypress do |key|
      case key
        when 'p' then @animation.stop
        when 'r' then @animation.start
        when 'q' then quit
      else
        @engine.change_direction(key) if [:up, :right, :left, :down].include?(key)
      end
    end
  end

  class Snake
    WIDTH = 10
    HEIGHT = 10
  end
end

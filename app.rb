require 'shnakes/game_engine'

module Shnakes
  WIDTH = 450
  HEIGHT = 400

  Shoes.app title: 'SHNAKES!', width: WIDTH, height: HEIGHT do

    @debug = para "NO KEY is PRESSED."
    @direction = :right
    @square = rect(top: 195, left: 220, width: 10, height: 10, center: false)
    @engine = GameEngine.new(self, @square, @debug)

    @clock = animate(24) do
      @engine.tick(@direction, @clock)
    end

    keypress do |key|
      case key
        when 'p' then @animation.stop
        when 'r' then @animation.start
        when 'q' then quit
        when :up then @direction = :up
        when :right then @direction = :right
        when :left then @direction = :left
        when :down then @direction = :down
      end

      # @debug.replace "#{key.inspect}"
    end
  end

  class Snake
    WIDTH = 10
    HEIGHT = 10
  end
end

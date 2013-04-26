require 'shnakes/death_condition'

module Shnakes

  class GameEngine
    def initialize(app, square, debug)
      @app = app
      @square = square
      @debug = debug
    end

    def tick(direction, clock)
      case direction
        when :right then @square.move(@square.left + 5, @square.top)
        when :left then @square.move(@square.left - 5, @square.top)
        when :down then @square.move(@square.left, @square.top + 5)
        when :up then @square.move(@square.left, @square.top - 5)
      end

      @debug.replace "#{@square.left} - #{@square.top}"

      checker = Shnakes::DeathCondition.new(@square.left, @square.top)

      if checker.dead?
        clock.stop
      end
    end
  end
end

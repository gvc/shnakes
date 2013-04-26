require 'shnakes/death_condition'
require 'shnakes/snake'

module Shnakes

  class GameEngine
    def initialize(app, debug)
      @app = app
      @snake = Snake.new(app)
      @debug = debug
      @direction = :right
    end

    def change_direction(new_direction)
      @direction = new_direction
    end

    def tick(clock)
      case @direction
        when :right then @snake.go_right
        when :left then @snake.go_left
        when :down then @snake.go_down
        when :up then @snake.go_up
      end

      @debug.replace "#{@snake.left} - #{@snake.top}"
      checker = Shnakes::DeathCondition.new(@snake)

      if checker.dead?
        clock.stop
      end
    end
  end
end

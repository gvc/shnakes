require 'shnakes/death_condition'
require 'shnakes/food_condition'
require 'shnakes/snake'

module Shnakes

  class GameEngine
    def initialize(app, debug)
      @app = app
      @snake = Snake.new(app)
      @debug = debug
      @food = nil
      @score = 0
      @app.update_score(@score)
    end

    def cleanup
      @food.remove if @food
      @snake.cleanup
    end

    def change_direction(new_direction)
      @snake.direction = new_direction
    end

    def tick(clock)
      @snake.move
      create_food if @food.nil?

      death_checker = Shnakes::DeathCondition.new(@snake)
      if death_checker.dead?
        clock.stop
      end

      food_checker = Shnakes::FoodCondition.new(@snake, @food)
      if food_checker.ate?
        @score += 1
        @app.update_score @score
        @snake.increase_speed
        @food.remove
        @food = nil
      end
    end

  private

    def create_food
      @food = @app.oval(width: 5, height: 5, radius: 4, left: rand(WIDTH - 10) + 5, top: rand(HEIGHT - 10) + 5, center: false)
    end
  end
end

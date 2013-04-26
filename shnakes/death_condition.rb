module Shnakes

  class DeathCondition
    def initialize(snake)
      @snake = snake
    end

    def dead?
      left = @snake.left
      top = @snake.top

      left <= 0 || left >= WIDTH - Snake::WIDTH || top <= 0 || top >= HEIGHT - Snake::HEIGHT
    end
  end
end

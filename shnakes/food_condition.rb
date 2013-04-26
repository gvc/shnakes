module Shnakes

  class FoodCondition

    def initialize(snake, food)
      @snake = snake
      @food = food
    end

    def ate?
      inside_food_bounding_box?(@snake.left, @snake.top) or
        inside_food_bounding_box?(@snake.left, @snake.top + Snake::HEIGHT) or
        inside_food_bounding_box?(@snake.left + Snake::WIDTH/2, @snake.top + Snake::HEIGHT/2) or
        inside_food_bounding_box?(@snake.left + Snake::WIDTH, @snake.tops) or
        inside_food_bounding_box?(@snake.left + Snake::WIDTH, @snake.top + Snake::HEIGHT)
    end

  private

    def inside_food_bounding_box?(x, y)
      (@food.left..(@food.left + Snake::WIDTH)).to_a.include?(x.to_i) and
        (@food.top..(@food.top + Snake::HEIGHT)).to_a.include?(y.to_i)
    end
  end
end

module Shnakes

  class Snake
    WIDTH = 10
    HEIGHT = 10
    SPEED = 5

    def initialize(app)
      @app = app
      @square = @app.rect(top: 195, left: 220, width: WIDTH, height: HEIGHT, center: false)
    end

    def left
      @square.left
    end

    def top
      @square.top
    end

    def go_right
      @square.move(@square.left + SPEED, @square.top)
    end

    def go_left
      @square.move(@square.left - SPEED, @square.top)
    end

    def go_down
      @square.move(@square.left, @square.top + SPEED)
    end

    def go_up
      @square.move(@square.left, @square.top - SPEED)
    end
  end
end

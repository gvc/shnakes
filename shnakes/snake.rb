module Shnakes

  class Snake
    WIDTH = 10
    HEIGHT = 10

    attr_accessor :direction

    def initialize(app)
      @app = app
      @app.stroke @app.seagreen
      @square = @app.rect(top: 195, left: 220, width: WIDTH, height: HEIGHT, center: false)
      @speed = 5
      @direction = :right
    end

    def cleanup
      @square.remove
    end

    def left
      @square.left
    end

    def top
      @square.top
    end

    def increase_speed
      @speed += 1
    end

    def move
      case @direction
        when :right then go_right
        when :left then go_left
        when :down then go_down
        when :up then go_up
      end
    end

  private
    def go_right
      @square.move(@square.left + @speed, @square.top)
    end

    def go_left
      @square.move(@square.left - @speed, @square.top)
    end

    def go_down
      @square.move(@square.left, @square.top + @speed)
    end

    def go_up
      @square.move(@square.left, @square.top - @speed)
    end
  end
end

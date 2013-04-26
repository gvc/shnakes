module SHNAKES
  WIDTH = 450
  HEIGHT = 400

  Shoes.app title: 'SHNAKES!', width: WIDTH, height: HEIGHT do

    @debug = para "NO KEY is PRESSED."
    @direction = :right
    @square = rect(top: 195, left: 220, width: 10, height: 10, center: false)

    @animation = animate(24) do
      case @direction
        when :right then @square.move(@square.left + 5, @square.top)
        when :left then @square.move(@square.left - 5, @square.top)
        when :down then @square.move(@square.left, @square.top + 5)
        when :up then @square.move(@square.left, @square.top - 5)
      end

      @debug.replace "#{@square.left} - #{@square.top}"

      checker = SHNAKES::DeathCondition.new(@square.left, @square.top)

      if checker.dead?
        background red
        @animation.stop
      end
    end

    keypress do |key|
      case key
        when 'p' then @animation.stop
        when 'r' then @animation.start
        when 'q' then exit
        when :up then @direction = :up
        when :right then @direction = :right
        when :left then @direction = :left
        when :down then @direction = :down
      end

      # @debug.replace "#{key.inspect}"
    end
  end

  class DeathCondition
    def initialize(left, top)
      @left = left
      @top = top
    end

    def dead?
      @left <= 0 || @left >= WIDTH - Snake::WIDTH || @top <= 0 || @top >= HEIGHT - Snake::HEIGHT
    end
  end

  class Snake
    WIDTH = 10
    HEIGHT = 10
  end
end

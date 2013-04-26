module Shnakes

  class DeathCondition
    def initialize(left, top)
      @left = left
      @top = top
    end

    def dead?
      @left <= 0 || @left >= WIDTH - Snake::WIDTH || @top <= 0 || @top >= HEIGHT - Snake::HEIGHT
    end
  end
end

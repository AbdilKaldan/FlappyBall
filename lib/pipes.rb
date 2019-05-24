require './lib/pipe'

class Pipes
  attr_accessor :score ,:a
  def initialize width, height
    @a,@score = 0
    @score= 0
    @window_width = width
    @window_height = height
    @current = Pipe.new width, height, width
    @next = Pipe.new width, height, width*5/3
  end

  def reset
    @current = Pipe.new @window_width, @window_height, @window_width
    @next = Pipe.new @window_width, @window_height, @window_width*5/3
    @score = 0
  end

  def update state, ball
    @ball = ball
    if @ball >= 370
      @a = false
    end
    if @current.x <= 75 && @current.x >= -2 
      if (@ball < @current.send-25) && (@ball > @current.send-141)
        @a = true
      else
        @a = false
      end
    end
    if @a != false 
      @current.update
      @next.update
      if @current.gone? 
        @current = @next
        @next = Pipe.new @window_width, @window_height, @current.x+@window_width*2/3
      end
    end
    if @current.x == 0 && @a == true
      @score +=1
    end
  end

  def draw
    @current.draw
    @next.draw
  end
end

require './lib/pipe'

class Pipes
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
    puts @score
  end

  def update state, ball
    @ball = ball
    @current.update
    @next.update
    if @current.gone? 
      @current = @next
      @next = Pipe.new @window_width, @window_height, @current.x+@window_width*2/3
    end
    if @ball < -40 || @ball > 535
      reset
    end
    if @current.x < 80 && @current.x > 0 
      if (@ball < @current.send-20) && (@ball > @current.send-140)
        @a = true
      else
        @a = false
        reset
      end
    end
    if @current.x == 0 && @a == true
      @score +=1
      puts @score
    end
  end

  def draw
    @current.draw
    @next.draw
  end
end

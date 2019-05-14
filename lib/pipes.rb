require './lib/pipe'

class Pipes
  def initialize width, height
    @window_width = width
    @window_height = height
    @current = Pipe.new width, height, width
    @next = Pipe.new width, height, width*5/3
  end

  def reset
    @current = Pipe.new @window_width, @window_height, @window_width
    @next = Pipe.new @window_width, @window_height, @window_width*5/3
  end

  def update state
    @current.update
    @next.update
    if @current.gone?
      @current = @next
      @next = Pipe.new @window_width, @window_height, @current.x+@window_width*2/3
    end
  end

  def draw
    @current.draw
    @next.draw
  end
end

class Pipe
  attr_reader :x

  def initialize width, height, x
    @up = Gosu::Image.new './img/tube_up.png'
    @down = Gosu::Image.new './img/tube_down.png'
    @up_height = rand(@up.height*2/3) + 50
    @gap = height / 3.5 # gap = 141.71428571428572
    @x = x
  end

  def gone?
    @x + @up.width < 0
  end

  def update
    @x -= 1
  end

  def draw
    @up.draw @x, @up_height-@up.height, 1
    @down.draw @x, @up_height+@gap, 1
  end
end

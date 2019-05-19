class Pipe
  attr_reader :x, :send
  def initialize width, height, x
    @up = Gosu::Image.new './img/tube_up.png'
    @down = Gosu::Image.new './img/tube_down.png'
    @up_height = rand(@up.height*2/3) + 50
    @gap = 141 # gap = 141
    @send = @up_height + @gap
    @x = x
  end

  def gone?
    @x + @up.width < 0
  end

  def update
    @x -= 1.5
  end

  def draw
    @up.draw @x, @up_height-@up.height, 1
    @down.draw @x, @send , 1
  end
end

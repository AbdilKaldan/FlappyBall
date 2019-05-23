require './lib/pipes'

class Curr
    attr_accessor :dead, :welcome
    def initialize
        @font     = Gosu::Font.new 25, name: './font/04B_19__.ttf'
        @welcome  = true
        @dead = false
        @width = 288
        @height = 496
    end

    def update state
      @welcome, @dead = false, false if state != 0
    end
    
    def draw
      if @welcome
        title = 'Flappy Ball'
        help = 'Press Space to Start'
        title_width = @font.text_width title
        help_width = @font.text_width help
        @font.draw title, (@width-title_width)/2, @height/10, 0
        @font.draw help, (@width-help_width)/2, @height/3, 0
        @welcome = false
      end
      if @dead
        msg = 'You are dead'
        help = 'Press Space to Reset'
        msg_width = @font.text_width msg
        help_width = @font.text_width help
        @font.draw msg, (@width-msg_width)/2, @height/1.5, 2
        @font.draw help, (@width-help_width)/2, @height/1.5+50, 2
    end
  end
end
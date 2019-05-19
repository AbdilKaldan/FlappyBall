require 'gosu'
require './lib/pipes'

GRAVITY = 600
JUMP_VEL = 300

class Game < Gosu::Window
    def initialize(*args)
        super 
        self.caption = 'Flappy Ball'
        width = 288
        height = 496
        @scroll_x = 0
        @ball_y = 200
        @ball_y_vel = 0
        @images = {
            background: Gosu::Image.new(self,'img/background.png',false),
            foreground: Gosu::Image.new(self,'img/ground.png',true),
            ball: Gosu::Image.new(self,'img/ball.png',false),
        }
        @walls = Pipes.new width, height
    end

    def button_down(button)
        close if button == Gosu::KbEscape
        if button == Gosu::KbSpace
            @ball_y_vel = -JUMP_VEL
        end
    end

    def reset
        @walls.reset
    end

    def update
        @scroll_x +=3
        if @scroll_x > @images[:foreground].width
            @scroll_x = 0
        end
        tl = update_interval / 1000.0
        @ball_y_vel += tl * GRAVITY
        @ball_y += @ball_y_vel * tl
        @walls.update 3 , @ball_y
    end

    def draw
        @images[:background].draw(0,0,0)
        @images[:foreground].draw(-@scroll_x,383,0)
        @images[:foreground].draw(-@scroll_x + @images[:foreground].width,383,0)
        @images[:ball].draw(55,@ball_y,0)
        @walls.draw
    end
end

game = Game.new(288,496,false)
game.show
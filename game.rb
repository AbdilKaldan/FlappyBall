require 'gosu'
require './lib/pipes'
require './lib/curr'

GRAVITY = 600
JUMP_VEL = 300

class Game < Gosu::Window
    def initialize(*args)
        super 
        self.caption = 'Flappy Ball'
        @scroll_x = 0
        @ball_y = 200
        @ball_y_vel = 0
        @font     = Gosu::Font.new 25, name: './font/04B_19__.ttf'
        @images = {
            background: Gosu::Image.new(self,'img/background.png',false),
            foreground: Gosu::Image.new(self,'img/ground.png',true),
            ball: Gosu::Image.new(self,'img/ball.png',false),
        }
        @walls = Pipes.new width, height
        @curr= Curr.new
        @state = 0
    end

    def button_down(button)
        close if button == Gosu::KbEscape
        if button == Gosu::KbSpace
            @ball_y_vel = -JUMP_VEL
            @state = 1
        end
    end

    def reset
        @walls.reset
    end

    def update 
        if @walls.a != false
            @scroll_x +=3
            if @scroll_x > @images[:foreground].width
                @scroll_x = 0
            end
            @curr.welcome = true
            if @state == 1
                tl = update_interval / 1000.0
                @ball_y_vel += tl * GRAVITY
                @ball_y += @ball_y_vel * tl
                @walls.update 3 , @ball_y
                @curr.update @state
            end
        else
            @curr.dead = true
            puts @state
        end
    end

    def draw
        @images[:background].draw(0,0,0)
        @walls.draw
        @images[:foreground].draw(-@scroll_x,383,0)
        @images[:foreground].draw(-@scroll_x + @images[:foreground].width,383,0)
        @images[:ball].draw(50,@ball_y,0)
        @font.draw @walls.score, 144, 100,2
        @curr.draw
    end
end

game = Game.new(288,496,false)
game.show
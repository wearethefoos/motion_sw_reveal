module MotionSWReveal
  module AppDelegate
    def self.included(base)
      base.send :attr_accessor, :reveal_screen
    end

    def has_reveal_screen?
      !@reveal_screen.nil?
    end

    def open_reveal_screen(rear, front, options = {})
      @reveal_screen = RevealScreen.new(rear, front, options)
      open @reveal_screen
      @reveal_screen
    end

    def bind_reveal_screen_button(button)
      button.addTarget(@reveal_screen, action:'revealToggle:',
        forControlEvents:UIControlEventTouchUpInside)
    end
  end
end

PM::Delegate.send :include, MotionSWReveal::AppDelegate

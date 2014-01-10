module MotionSWReveal
  class RevealScreen < SWRevealViewController
    include ::PM::ScreenModule

    def self.new(rear, front, options = {})
      reveal_screen = alloc.initWithRearViewController nil, frontViewController: nil
      reveal_screen.set_screens rear: rear, front: front, right: options[:right]
      reveal_screen
    end

    def set_screens( options = {} )
      options = { animated: false }.merge(options)

      self.rear_screen = options[:rear] if options[:rear]
      self.right_screen = options[:right] if !options[:right].nil?
      set_front_screen options[:front], options[:animated] if options[:front]
    end

    def set_front_screen(screen, animated = true)
      screen = prepare_screen_for_pm(screen)
      screen = screen.navigationController || screen
      self.frontViewController = screen
      self.setFrontViewController screen, animated: animated
      bind_gesture_recognizer
    end

    def front_screen=(screen)
      screen = prepare_screen_for_pm(screen)
      screen = screen.navigationController || screen
      self.frontViewController = screen
      self.setFrontViewController screen, animated: true
      bind_gesture_recognizer
    end

    def rear_screen=(screen)
      screen = prepare_screen_for_pm(screen)
      screen = screen.navigationController || screen
      self.rearViewController = screen
    end

    def right_screen=(screen)
      screen = prepare_screen_for_pm(screen)
      screen = screen.navigationController || screen
      self.rightViewController = screen
    end

    def front_screen
      self.frontViewController
    end

    def rear_screen
      self.rearViewController
    end

    def right_screen
      self.rightViewController
    end

    def bind_gesture_recognizer
      frontViewController.view.addGestureRecognizer self.panGestureRecognizer
    end

    protected

    def prepare_screen_for_pm(screen)
      return if screen.nil?
      screen = set_up_screen_for_open(screen, {})
      ensure_wrapper_controller_in_place(screen, {})
      screen
    end
  end
end

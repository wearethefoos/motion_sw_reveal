# MotionSwReveal

A ProMotion gem for [SWRevealViewController][swreveal] by [John Lluch][john_lluch],
heavily inspired on [Promotion Slide Menu][promotion-slide-menu] by [Matt Brewer][matt_brewer] that depends on [PKRevealController][pkrevealcontroller] by [Phillip Kluz][p_kluz]. I could not get
Promotion Slide Menu working on [RubyMotion][rubymotion] and [ProMotion 1.1+][pro_motion]. I have
used SWRevealViewController before and I like it's ease of usage. This gem should be easy to use
as well.

## Installation

Add this line to your application's Gemfile:

    gem 'motion_sw_reveal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion_sw_reveal

## Usage

Basic use:

```ruby
# App Delegate

def on_load
  # Open a RevealScreen with:
  #  - NavigationScreen in the background.
  #  - HomeScreen as front screen.
  #
  open_reveal_screen NavigationScreen.new, HomeScreen.new
end
```

This opens a new `HomeScreen`. Swiping it to the right will reveal the `NavigationScreen`.

If you want a button to show the `NavigationScreen`, just bind an action for it:

```ruby
# Create a button (I use FontAwesome for the bars icon)
menu_btn = UIButton.buttonWithType UIButtonTypeRoundedRect

add menu_btn, {
  font:  FontAwesome.fontWithSize(20.0),
  frame: CGRectMake(0, 0, 30, 30)
}

menu_btn.setTitle FontAwesome.icon('bars'), forState: UIControlStateNormal

App.delegate.bind_reveal_screen_button menu_btn
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[swreveal]: https://github.com/John-Lluch/SWRevealViewController
[john_lluch]: https://github.com/John-Lluch
[promotion-slide-menu]: https://github.com/macfanatic/pro_motion_slide_menu
[matt_brewer]: https://github.com/macfanatic
[pkrevealcontroller]: https://github.com/pkluz/PKRevealController
[p_kluz]: https://github.com/pkluz
[rubymotion]: http://rubymotion.com
[pro_motion]: https://github.com/clearsightstudio/ProMotion
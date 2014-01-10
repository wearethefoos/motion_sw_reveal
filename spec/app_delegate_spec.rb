describe MotionSWReveal::AppDelegate do

  before do
    @delegate = App.delegate
  end

  it "should have a 'reveal_screen' attribute" do
    @delegate.respond_to?(:reveal_screen).should == true
  end

  it "should not have a slide menu by default" do
    @delegate.has_reveal_screen?.should == false
  end

  it "should respond to 'open_reveal_screen'" do
    @delegate.respond_to?(:open_reveal_screen).should == true
  end

  it "#open_reveal_screen should return a RevealScreen" do
    @delegate.open_reveal_screen(nil, nil).should.be.instance_of MotionSWReveal::RevealScreen
  end

  it "should have a RevealScreen as the rootViewController" do
    @delegate.window.rootViewController.should.be.instance_of MotionSWReveal::RevealScreen
  end

end

describe MotionSWReveal::RevealScreen do

  before do
    @delegate = App.delegate

    @rear  = LeftNavScreen.new
    @right = RightNavScreen.new
    @front = BlankScreen.new
  end

  it "should return an instance of RevealScreen" do
    screen = MotionSWReveal::RevealScreen.new nil, nil
    screen.should.be.instance_of MotionSWReveal::RevealScreen
  end

  it "should store rear, front, and right screen controllers" do
    screen = MotionSWReveal::RevealScreen.new @rear, @front, right: @right
    screen.rear_screen.should == @rear
    screen.front_screen.should == @front
  end

  it "should let me wrap the front screen in a UINavigationController" do
    front_screen = BlankScreen.new(nav_bar: true)
    screen = MotionSWReveal::RevealScreen.new @rear, front_screen
    screen.front_screen.should.be.instance_of PM::NavigationController
  end

  it "should let me set the title on the front screen during creation" do
    front_screen = BlankScreen.new(title: 'My Title')
    screen = MotionSWReveal::RevealScreen.new @rear, front_screen
    screen.front_screen.title.should == 'My Title'
  end

  it "should accept a plain UIViewController" do
    screen = MotionSWReveal::RevealScreen.new nil, nil
    should.not.raise(NoMethodError) { screen.rear_screen = UIViewController }
    screen.rear_screen.should.be.instance_of UIViewController
  end

  it "should allow you to set both a right and rear menu screen" do
    screen = MotionSWReveal::RevealScreen.new @rear, @front, right: @right
    screen.rear_screen.should == @rear
    screen.right_screen.should == @right
    screen.front_screen.should == @front
  end

end

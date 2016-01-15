require_relative 'spec_helper'

describe Robot do
  
  describe "#scan" do

    before :each do
      @robot1 = Robot.new
    end

    it "should not report any robots if they are not within 1 space" do
      @robot2 = Robot.new
      @robot3 = Robot.new
      
      @robot2.move_up
      @robot2.move_up
      @robot3.move_left
      @robot3.move_left
      expect(@robot1.scan.length).to eq(0)
    end

    it "should report all robots within 1 space" do
      @robot2 = Robot.new
      @robot3 = Robot.new
      
      @robot2.move_down
      @robot3.move_right
      expect(@robot1.scan).to include(@robot2, @robot3)
    end

    it "should not report all robots more than 2 spaces away" do
      @robot2 = Robot.new
      @robot3 = Robot.new
      
      @robot2.move_up
      @robot2.move_up
      @robot3.move_left
      expect(@robot1.scan).to include(@robot3)
    end

  end
end
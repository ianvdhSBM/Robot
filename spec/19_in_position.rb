require_relative 'spec_helper'

describe Robot do
  
  describe "self#in_position" do

    before :each do
      @robot1 = Robot.new
      @robot2 = Robot.new
    end


    it "should report all robots in a given position" do
      expect(Robot.in_position(0,0)).to include(@robot1, @robot2)
    end

    it "should report all robots in a given position" do
      @robot1.move_up
      @robot1.move_up
      @robot1.move_up
      @robot1.move_right
      expect(Robot.in_position(1,3)).to include(@robot1)
    end
  end
end
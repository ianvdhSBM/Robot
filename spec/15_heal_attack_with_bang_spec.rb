require_relative 'spec_helper'

describe Robot do
  
  before :each do
    @robot1 = Robot.new
    @robot2 = Robot.new
    @box1 = BoxOfBolts.new
    @plasma = PlasmaCannon.new
  end

  describe "#heal!" do

    it "Exception error should raise if robots tries to #heal! at 0 health or less" do
      @robot1.wound(100)
      expect{@robot1.heal!(10)}.to raise_error(NoHealError)
    end
  end

  describe "#attack!" do 
    
    it "Exception error should raise if robot attacks non-robot" do
      expect { @robot1.attack!(@box1) }.to raise_error(NotARobotError)
    end
  end

end
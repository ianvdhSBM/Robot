require_relative 'spec_helper'


describe Robot do
  
  before :each do
    @robot = Robot.new
  end

  it "Robot begins with 50 shield points" do
    expect(@robot.shield_points).to eq(50)
  end

  describe "#wound" do
  
    it "damage should decrease shield before health" do
      @robot.wound(20)
      expect(@robot.shield_points).to eq(30)
    end

    it "damage will not decrease shield below zero" do
      @robot.wound(60)
      expect(@robot.shield_points).to eq(0)
    end

    it "when damage depletes shield, remaining damage is taken from health" do
      @robot.wound(60)
      expect(@robot.shield_points).to eq(0)
      expect(@robot.health).to eq(90)
    end

  end

  # describe "#heal" do

  #   it "when robot box of bolts are consumed, shields will recharge" do
  #     robot.wound(50)
  #   end

end
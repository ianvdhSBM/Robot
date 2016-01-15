require_relative 'spec_helper'

describe Battery do
  
  before :each do
    @battery = Battery.new
  end

  it "should be an Item" do
    expect(@battery).to be_an(Item)
  end

  it "has a name battery" do
    expect(@battery.name).to eq("battery")
  end

  it "has a weight of 25" do
    expect(@battery.weight).to eq(25)
  end

  describe "#repair" do

    before :each do
      @robot = Robot.new
    end

    it "repair_shield regenerates 15 shield points" do
      expect(@robot).to receive(:shield_regenerate).with(15)
      @battery.repair_shield(@robot)
    end

  end

end
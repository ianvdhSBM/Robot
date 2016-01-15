require_relative 'spec_helper'

describe Robot do
  
  before :each do
    @robot1 = Robot.new
    @robot2 = Robot.new
  end

  describe "self#all_robots" do

    it "should return an array length of 2" do
      expect(Robot.all_robots.length).to eq(2)
    end

  end
end
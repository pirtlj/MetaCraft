require 'spec_helper'

describe Map do
  it "can be instantiated" do
    Map.new.should be_an_instance_of(Map)
  end

  it "can be saved successfully" do
    Map.create.should be_persisted
  end
end
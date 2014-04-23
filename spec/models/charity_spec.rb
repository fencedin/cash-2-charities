require 'spec_helper'

describe Charity do
  it 'should validate the presence of name' do
    charity = FactoryGirl.build(:charity, name: "")
    charity.save.should eq false
  end

  it 'should validate the presence of mission' do
    charity = FactoryGirl.build(:charity, mission: "")
    charity.save.should eq false
  end

  it 'should validate founded date is not in the future' do
    charity = FactoryGirl.build(:charity, founded: '2099-05-01')
    charity.save.should eq false
  end

end

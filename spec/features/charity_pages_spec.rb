require 'spec_helper'

describe Charity do
  it "creates a new charity" do
    charity = FactoryGirl.build(:charity)
    visit root_path
    click_on "Add Charity"
    fill_in :charity_name, with: charity.name
    fill_in :charity_mission, with: charity.mission
    fill_in :charity_description, with: charity.description
    fill_in :charity_founded, with: charity.founded
    click_button "Create Charity"
    page.should have_content "Your charity was created!"
  end

  it "edits a charity" do
    charity = FactoryGirl.create(:charity)
    visit charity_path(charity)
    click_on "Edit Charity"
    fill_in :charity_name, with: "Apples"
    click_button "Update Charity"
    page.should have_content "Apples"
  end

  it "doesn't edit a charity if things are not updated correctly" do
    charity = FactoryGirl.create(:charity)
    visit charity_path(charity)
    click_on "Edit Charity"
    fill_in :charity_name, with: ""
    click_button "Update Charity"
    page.should have_content "Errors"
  end

  it "doesn't edit a charity if things are not updated correctly" do
    charity = FactoryGirl.create(:charity)
    visit charity_path(charity)
    click_on "Edit Charity"
    fill_in :charity_founded, with: "2099-12-12"
    click_button "Update Charity"
    page.should have_content "Errors"
  end

  it "deletes a charity" do
    charity = FactoryGirl.create(:charity)
    visit charity_path(charity)
    click_on "Remove Charity"
    page.should_not have_content charity.name
  end
end

require "rails_helper"

describe "add a user process" do
  it "adds a user" do
    visit '/'
    click_on "Register"
    fill_in "Email", :with => "Mike@Mike.com"
    fill_in "Password", :with => "12345678"
    fill_in "Password confirmation", :with => "12345678"
    click_on "Sign up"
    expect(page).to have_content "successfully"
  end
end

describe "will log a user in" do
  it "logs a user in" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on "Sign in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"
    expect(page).to have_content "successfully."
  end
end

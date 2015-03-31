require 'rails_helper'

describe "add a question process" do
  it "add a question" do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)
    visit '/'
    click_on 'Add question'
    fill_in 'Title', :with => question.title
    fill_in 'Content', :with => question.content
    click_on 'Create question'
    expect(page).to have_content "successfully"
  end
end

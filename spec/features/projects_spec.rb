
require 'rails_helper'

def new_user
  user = FactoryBot.create(:user)
  login_as(user)
end

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      new_user
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      fill_in "project_descriptionMore", with: "Test more info"
      fill_in "project_infoLink", with: "link test"
      click_button "Create Project"
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content", descriptionMore: "Test more content", infoLink: "infoLink") }
    before(:each) do
      new_user
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
        fill_in "project_descriptionMore", with: "More description content"
        fill_in "project_infoLink", with: "infoLink"
      end
      click_button "Update Project"
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content", descriptionMore: "more content", infoLink: "infoLink") }
    before(:each) do
      new_user
    end
    scenario "remove project" do
      visit project_path(project)
      click_link "Destroy"
      expect(Project.count).to eq(0)
    end
  end
end

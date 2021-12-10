require "rails_helper"

RSpec.describe Project, type: :model do

  context "validations tests" do
    it "ensures the decription is present" do
      project = Project.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end

    it "ensures the description is present" do
      project = Project.new(title: "Title")
      expect(project.valid?).to eq(false)
    end
    
    it "ensures the decription more is present" do
      project = Project.new(descriptionMore: "Content of the further description")
      expect(project.valid?).to eq(false)
    end

    it "ensures the info link field is present" do
      project = Project.new(infoLink: "Content of the info link")
      expect(project.valid?).to eq(false)
    end
    
    it "should be able to save project" do
      project = Project.new(title: "Title", description: "Some description content goes here", descriptionMore: "Content of the further description", infoLink: "Content of the info link")
      expect(project.save).to eq(true)
    end
  end

  context "scopes tests" do

  end
end

require "rails_helper"

RSpec.describe Project, type: :model do
  # ...

  context "scopes tests" do
    let(:params) { { title: "Title", description: "some description", descriptionMore: "DescriptionMore", infoLink: "infoLink" } }
    before(:each) do
      Project.create(params)
      Project.create(params)
      Project.create(params)
    end

    it "should return all projects" do
      expect(Project.count).to eq(3)
    end

  end
end
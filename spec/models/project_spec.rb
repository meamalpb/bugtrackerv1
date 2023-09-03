require 'rails_helper'

RSpec.describe Project, type: :model do
    context "Creating a project" do
        it "shud be valid" do
            user = FactoryBot.create(:user)
            project = FactoryBot.build(:project, project_lead_id: user.id)
            expect(project).to be_valid
          end
    end

end

require 'rails_helper'

RSpec.describe User, type: :model do
    context "Creating a user" do
        it "shud be valid when the username and password are valid" do
            user = FactoryBot.build(:user)
            expect(user).to be_valid
          end
          it "shud not be valid when the username and password are invalid" do
            user = FactoryBot.build(:user,email: nil)
            expect(user).to_not be_valid
          end
          it "shud not be valid when the password is less than 6 digits" do
            user = FactoryBot.build(:user,email: '123')
            expect(user).to_not be_valid
          end
    end

    context "Duplicate users" do
        it "should not be valid" do
            user = FactoryBot.create(:user,email: 'ama@kmail.com')
            user2 = FactoryBot.build(:user,email: 'ama@kmail.com')
            expect(user2).to_not be_valid
        end
    end

end

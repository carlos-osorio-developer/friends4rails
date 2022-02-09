require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe "friendship validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:friend_id) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:friend_id) }
  end
end

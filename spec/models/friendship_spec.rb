require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe "friendship validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:friend_id) }
    it { should validate_inclusion_of(:accepted).in_array([true, false]) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:friend_id).with_message("is already a friend") }
  end
end

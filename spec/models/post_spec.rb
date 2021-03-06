require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "post validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user_id) }
  end
end

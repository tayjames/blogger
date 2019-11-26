require 'rails_helper'

describe Article, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:body)}
  end
end

require 'rails_helper'

describe Comment, type: :model do
  describe "relationships" do
    it { should belong_to(:article)}
  end
end

require 'rails_helper'

describe ApplicationHelper do
  describe "#full_title" do
    it "returns full title" do
      expect(full_title("Help")).to eq("Help | Ruby on Rails Tutorial Sample App")
    end
  end
end

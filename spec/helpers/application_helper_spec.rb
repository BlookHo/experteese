require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe ApplicationHelper, type: :helper do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "full_title" do
    it "should include the page title" do
      expect(full_title("foo")).to match(/foo/)
    end
    
    it "should include the base title" do
      expect(full_title("foo")).to match(/Experteese RoR Sample App/)
    end
    
    it "should not include a bar for the home page" do
      expect(full_title("")).not_to match(/\|/)
    end
  end




end

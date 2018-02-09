require 'rails_helper'

RSpec.describe Memo, type: :model do
  before {
    User.new(name: "Eliel", email: "eliel@test.com")
  }

  describe "Validaitons" do
    it "is valid with valid attributions" do
      memo = Memo.new(
        title: "sky memo",
        date: DateTime.now.utc,
        text_body: "lalalala",
        user: subject
      )
    expect(memo).to be_valid
    end

    it "is not valid without title" do
      bad_memo = Memo.new(
        title: nil,
        date: DateTime.now.utc,
        text_body: "lalala",
        user: subject
      )
    expect(bad_memo).to_not be_valid
    end

    it "is invalid without an time" do
      bad_memo = Memo.new(
        title: "My Memo",
        date: nil,
        text_body: "This is the text body",
        user: subject
      )
      expect(bad_memo).to_not be_valid
    end

    it "is invalid without an text body" do
      bad_memo = Memo.new(
        title: "My Memo",
        date: DateTime.now.utc,
        text_body: nil,
        user: subject
      )
      expect(bad_memo).to_not be_valid
    end

    it "is invalid without a user" do
      bad_memo = Memo.new(
        title: "My Memo",
        date: DateTime.now.utc,
        text_body: nil,
        user: nil
      )
      expect(bad_memo).to_not be_valid
    end
  end

  describe "Associations" do
    it "should belong to one user" do
      assoc = Memo.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end

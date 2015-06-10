require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        @pos_vote = Vote.create(value: 1)
        @neg_vote = Vote.create(value: -1)
        @other_vote = Vote.create(value: 2)

        expect( @pos_vote.valid? ).to eq(true)
        expect( @neg_vote.valid? ).to eq(true)
        expect( @other_vote.valid? ).to eq(false)
      end
    end
  end
end
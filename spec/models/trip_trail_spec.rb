require 'rails_helper'

describe TripTrail, type: :model do
  it { is_expected.to belong_to(:trip) }
  it { is_expected.to belong_to(:trail) }
end
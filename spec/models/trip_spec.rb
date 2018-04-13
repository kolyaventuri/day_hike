require 'rails_helper'

describe Trip, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to have_many(:trip_trails) }
  it { is_expected.to have_many(:trails).through(:trip_trails) }
end

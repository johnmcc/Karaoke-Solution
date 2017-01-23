require "minitest/autorun"
require "minitest/rg"

require_relative "../guest"
require_relative "../song"

class TestGuest < Minitest::Test
  def setup
    @song1 = Song.new("Agadoo", "Black Lace")
    @guest1 = Guest.new("Jimmy Test", @song1)
  end

  def test_get_guest_name
    assert_equal("Jimmy Test", @guest1.name)
  end

  def test_get_favourite_song
    assert_equal(@song1, @guest1.favourite_song)
  end
end
require "minitest/autorun"
require "minitest/rg"

require_relative "../guest"

class TestGuest < Minitest::Test
  def setup
    @guest1 = Guest.new("Jimmy Test", "Agadoo")
  end

  def test_get_guest_name
    assert_equal("Jimmy Test", @guest1.name)
  end

  def test_get_favourite_song
    assert_equal("Agadoo", @guest1.favourite_song)
  end
end
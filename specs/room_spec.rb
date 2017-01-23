require "minitest/autorun"
require "minitest/rg"

require_relative "../room"
require_relative "../song"
require_relative "../guest"

class TestRoom < Minitest::Test
  def setup
    @song1 = Song.new("Agadoo", "Black Lace")
    @song2 = Song.new("Macarena", "Los Del Rio")

    @guest1 = Guest.new("Timmy Test", @song1)
    @guest2 = Guest.new("Jim Jefferson", @song2)
    @guest3 = Guest.new("Alison Abbey", nil)

    @room1 = Room.new(2)
  end

  def test_initial_capacity
    assert_equal(2, @room1.capacity)
  end

  def test_add_song
    @room1.add_song(@song1)
    assert_equal(1, @room1.song_count)
  end

  def test_add_favourite_song
    @room1.check_in_guest(@guest1)
    cheer = @room1.add_song(@song1)

    assert_equal("Woohoo!", cheer)
  end

  def test_add_guest_to_room
    @room1.check_in_guest(@guest1)
    assert_equal(1, @room1.guest_count)
  end

  def test_add_guest_beyond_capacity
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)
    @room1.check_in_guest(@guest3)

    assert_equal(2, @room1.guest_count)
  end

  def test_remove_guest_from_room
    @room1.check_in_guest(@guest1)
    @room1.check_in_guest(@guest2)

    guest = @room1.check_out_guest(@guest2)
    
    assert_equal(guest, @guest2)
    assert_equal(1, @room1.guest_count)
  end
end
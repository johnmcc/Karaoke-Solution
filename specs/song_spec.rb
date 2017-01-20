require "minitest/autorun"
require "minitest/rg"

require_relative "../song"

class SongTest < Minitest::Test
  def setup
    @song1 = Song.new("Agadoo", "Black Lace")
  end

  def test_get_title
    assert_equal("Agadoo", @song1.title)
  end

  def test_get_artist
    assert_equal("Black Lace", @song1.artist)
  end
end
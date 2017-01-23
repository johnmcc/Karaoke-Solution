class Room
  attr_reader :capacity
  def initialize(capacity)
    @capacity = capacity
    @guests = []
    @playlist = []
  end

  def song_count
    @playlist.count
  end

  def add_song(song)
    @playlist << song
    favourite_songs = @guests.map {|guest| guest.favourite_song}
    return "Woohoo!" if favourite_songs.include? song
  end

  def guest_count
    @guests.count
  end

  def check_in_guest(guest)
    if !@guests.include?(guest) && @guests.count < @capacity
      @guests << guest 
    end
  end

  def check_out_guest(guest)
    @guests.delete(guest)
  end
end
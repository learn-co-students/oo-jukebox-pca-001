class Jukebox
  attr_reader :songs
  attr_accessor :input

  def initialize(songs)
    @songs = songs
    @input = ''
  end

  def help
    puts "You can really only do a couple of things, kid:"
    puts "'play' to get a list of songs to play"
    puts "'help' to get help (but you already knew that)"
    puts "'exit' to get the heck outta here"
    puts "'list' see the songs you can play"
  end

  def list
    self.songs.each_with_index do |song, i|
      puts "#{i+1}. #{song}"
    end
  end

  def play(song=nil)
    if song
      if song.to_i.to_s == song
        puts "Now Playing: #{self.songs[song.to_i-1] || 'Nothing'}"
      elsif self.songs.map {|s| s.downcase}.include?(song.downcase)
        printable_song = self.songs.detect {|s| s.downcase == song.downcase}
        puts "Now Playing: #{printable_song}"
      else
        puts "Sorry, I don't know that song."
      end
    else
      self.list
      puts "What song?"
      play(gets.downcase.strip)
    end
  end

  def do_command(command)
    song = nil
    if command.split.size > 1
      split_command = command.split
      command = split_command[0]
      song = split_command[1..-1].map {|s| s.downcase}.join(' ')
    end

    case command
    when 'play'
      if song
        self.play(song)
      else
        self.play
      end
    when 'list'
      self.list
    when 'help'
      self.help
    when 'exit'
      puts "Bye!"
    else
      puts "I don't understand..."
    end
  end

  def call
    puts "Hello!"
    while self.input != 'exit'
      print 'Enter a command: '
      self.input = gets.downcase.strip
      self.do_command(self.input)
    end
  end
end
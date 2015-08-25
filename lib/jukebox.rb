class Jukebox

  attr_accessor :songs, :input

  def initialize(songs)
    @songs = songs
  end

  def call
    welcome
    while self.input != "exit"
      do_command
    end
    puts "goodbye"
  end

  def welcome
    puts "Welcome to the Jukebox! Type 'help' to see the list of available commands"
  end

  def help
    puts "This list of commands are:"
    puts "help"
    puts "list"
    puts "play"
    puts "exit"
  end

  def list
    self.songs.each_with_index do |song, i|
      puts "#{i + 1}. #{song}"
    end
  end

  def get_input
    puts "Enter a command:"
    self.input = gets.chomp.downcase
  end

  def do_command
    get_input
    case self.input
    when "help"
      help
    when "list"
      list
    when "play"
      play
    else
      "please enter a valid command."
    end
  end

  def get_song
    puts "Enter a song number or enter the artist and song title, as shown in the list above"
    gets.chomp
  end

  def play
    response = get_song
    if songs.include?(response) 
      songs.each do |song|
        if song == response
          puts "Now playing #{song}"
        end
      end
    elsif (0..(songs.length - 1)).include?(response.to_i)
      puts "Now playing: #{songs[response.to_i - 1]}"
    else 
      puts "please enter a valid title or number"
    end
  end

end
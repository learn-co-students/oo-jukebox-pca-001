class Jukebox
  attr_accessor :songs, :input

  def initialize(songs)
    @songs = songs
  end

  def help
    puts "help\nlist\nplay\nexit"
  end

  def get_input
    puts "Enter a command:"
    @input = gets.chomp #may be uninitialized?
  end

  def do_command
    get_input
    case @input
    when "help"
      help
      ""
    when "list"
      list
      ""
    when "play"
      play
      ""
    when "exit"
      "exit"
    else
      puts "Error, #{@input} not defined"
      ""
    end
  end

  def list
    @songs.each_with_index { |song, i| puts "#{i + 1} #{song}" }
  end

  def play
    puts "Enter a song number or enter the artist and song title, as shown in the list above"
    user_input = gets.chomp
    if @songs.include?(user_input)
      puts "Now playing #{user_input}"
    elsif (user_input.to_i > 0 && user_input.to_i < 8)
      puts "Now playing: #{@songs[user_input.to_i - 1]}"
    else
      puts "sorry, please enter a valid song or type 'help' for more options."
    end
  end

  def call
    nil
  end

  def self.call
    puts "Welcome to the Jukebox! Type 'help' to see the list of available commands"
    do_command until do_command == "exit"
  end
end

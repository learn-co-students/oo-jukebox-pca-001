class Jukebox
  attr_accessor :songs, :input

  def initialize(songs)
    @songs = songs
  end

  def get_input
    puts "Enter a command:"
    @input = gets.chomp
  end

  def help
    puts "I accept the following commands:"
    puts "- help : displays this help message"
    puts "- list : displays a list of songs you can play"
    puts "- play : lets you choose a song to play"
    puts "- exit : exits this program"
  end

  def list
    songs.each_with_index { |s, i| puts "#{i + 1}. " + s }
  end

  def play
    puts "Enter a song number or enter the artist and song title, as shown in the list above"
    user_input = gets.strip
    if songs.include?(user_input)
      puts "Now playing " + user_input
    elsif user_input.length < 2 && user_input.to_i < 10
      puts "Now playing: " + songs[user_input.to_i - 1]
    else
      puts "Invalid input, please try again"
    end
  end

  def do_command
    get_input
    help if @input == "help"
    list if @input == "list"
    play if @input == "play"
  end

  def call
    puts "Welcome to the Jukebox! Type 'help' to see the list of available commands"
    do_command
    call unless @input == "exit"
  end
end

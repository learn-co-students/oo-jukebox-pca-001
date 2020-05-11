require "pry"
class Jukebox
  attr_accessor :songs, :input

  def initialize(songs)
    @songs = songs
  end

  def get_input
    puts "What do you want to do?"
    @input = gets.chomp
  end

  def call
    done = false

    until done
      puts "Welcome to the Jukebox! Type 'help' to see the list of available commands"
      get_input

      case @input
      when "exit"
        done = true
      when "help" || "play"
        do_input
      else
        puts invalid_input
      end
    end
  end

  def invalid_input
    puts "Sorry, I didn't get that. Try again?"
  end

  def help
    puts "Available commands:"
    puts "help"
    puts "list"
    puts "play"
    puts "exit"
  end

  def do_command
    case @input
    when "help"
      help
    when "play"
      play
    when "list"
      list
    when "exit"
      exit_jukebox
    end
  end

  def exit_jukebox
    "Thanks for playing!"
  end

  def list
    @songs.each_with_index { |song, index| puts "#{index + 1}. #{song}" }
  end

  def get_song_by_number(num)
    return nil if num.to_i <= 0

    @songs[num.to_i - 1]
  end

  def get_song_by_name(name)
    @songs.find { |song| song == name }
  end

  def get_song_by_name_or_number(song)
    get_song_by_name(song) || get_song_by_number(song)
  end

  def play
    puts "Enter a song number or enter the artist and song title, as shown in the list above"
    play_input = gets.chomp
    song = get_song_by_name_or_number(play_input)

    if play_input == "help"
      puts "Enter a song number or enter the artist and song title, as shown in the list above"
      puts "Enter 'Exit' to go back"
    elsif song
      puts "Now playing: #{get_song_by_name_or_number(song)}"
    else
      puts "sorry, please enter a valid song or type 'help' for more options."
    end
  end
end

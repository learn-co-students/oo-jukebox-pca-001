describe "Jukebox" do
  let(:songs) do
    [
      "Phoenix - 1901",
      "Tokyo Police Club - Wait Up",
      "Sufjan Stevens - Too Much",
      "The Naked and the Famous - Young Blood",
      "(Far From) Home - Tiga",
      "The Cults - Abducted",
      "Phoenix - Consolation Prizes",
      "Harry Chapman - Cats in the Cradle",
      "Amos Lee - Keep It Loose, Keep It Tight",
    ]
  end

  let(:song_regexes) do
    [
      /Phoenix - 1901/,
      /Tokyo Police Club - Wait Up/,
      /Sufjan Stevens - Too Much/,
      /The Naked and the Famous - Young Blood/,
      /\(Far From\) Home - Tiga/,
      /The Cults - Abducted/,
      /Phoenix - Consolation Prizes/,
      /Harry Chapman - Cats in the Cradle/,
      /Amos Lee - Keep It Loose, Keep It Tight/,
    ]
  end

  let(:song_regexes_with_indicies) do
    [
      /1\. Phoenix - 1901/,
      /2\. Tokyo Police Club - Wait Up/,
      /3\. Sufjan Stevens - Too Much/,
      /4\. The Naked and the Famous - Young Blood/,
      /5\. \(Far From\) Home - Tiga/,
      /6\. The Cults - Abducted/,
      /7\. Phoenix - Consolation Prizes/,
      /8\. Harry Chapman - Cats in the Cradle/,
      /9\. Amos Lee - Keep It Loose, Keep It Tight/,
    ]
  end

  let(:jukebox) { Jukebox.new(songs) }

  describe "#new" do
    it "accepts a list of songs on initialization" do
      expect { Jukebox.new(songs) }.to_not raise_error
    end

    it "assigns the list of songs to an instance variable" do
      expect(jukebox.instance_variable_get(:@songs)).to eq(songs)
    end

    it "creates new instances of itself" do
      expect(jukebox).to be_an_instance_of(Jukebox)
    end
  end

  describe "#input" do
    it "is a setter to get a user's input and is a getter to retrieve a user's input" do
      jukebox.input = "play"
      expect(jukebox.input).to eq("play")
    end
  end

  describe "#call" do
    it "responds to a call method" do
      expect(jukebox).to respond_to(:call)
    end
  end

  describe "#help" do
    it "prints the available commands" do
      help_output = capture_stdout { jukebox.help }
      expect(help_output).to include("help" && "list" && "play" && "exit")
    end
  end

  describe "#get_input" do
    it "prints a prompt for input to the user and stores the user response" do
      jukebox.stub(:gets).and_return("help")
      get_input_output = capture_stdout { jukebox.get_input }
      expect(jukebox.input).to eq("help")
    end
  end

  describe "#do_command" do
    it "calls the get_input method and invokes the appropriate method depending on the input of the user" do
      jukebox.stub(:gets).and_return("help")
      get_input_output = jukebox.get_input
      do_input_output = capture_stdout { jukebox.do_command }
      expect(do_input_output).to include("help" && "list" && "play" && "exit")
    end
  end

  describe "#list" do
    it "lists the songs a user can play" do
      list_output = capture_stdout { jukebox.list }
      song_regexes.each do |regex|
        expect(list_output).to match(regex)
      end
    end
  end

  describe "#play" do
    it "asks the user what song they'd like to play" do
      jukebox.stub(:gets).and_return("1")
      play_output = capture_stdout { jukebox.play }
      expect(play_output).to eq("Enter a song number or enter the artist and song title, as shown in the list above\nNow playing: Phoenix - 1901\n")
    end

    it "accepts a song name and plays that song" do
      jukebox.stub(:gets).and_return("Phoenix - 1901")
      play_output = capture_stdout { jukebox.play }
      expect(play_output).to match("Enter a song number or enter the artist and song title, as shown in the list above\nNow playing: Phoenix - 1901\n")
    end

    it "accepts a song number and plays that song" do
      jukebox.stub(:gets).and_return("2")
      play_output = capture_stdout { jukebox.play }
      expect(play_output).to match("Enter a song number or enter the artist and song title, as shown in the list above\nNow playing: Tokyo Police Club - Wait Up\n")
    end
  end
end

# Object Oriented Jukebox

## Objectives

1. Write an object oriented command line application.

## Overivew

In this lab, you'll be writing an object oriented jukebox. Your jukebox will introduce itself to the user and ask for input, and users should be able to ask for help, list available songs, play a song, and exit the program, all from the command line. 

## Instructions

* Take a look at `bin/jukebox`. This file is run by typing `ruby bin/jukebox`. Note that the file requires `lib/jukebox.rb`. 
* Your `Jukebox` class should accept a list of songs upon initialization, and you need an `attr_accessor` for sogns. The `initialize` methods should set an `@songs` intance variable equal to the songs array that comes in as an argument.
* `Jukebox` instances should respond to a `.call` method. This method is being invoked in the `bin` file, which, you might remember, is responsible for running the code in a command line app. The `.call` method should aggregate the other methods you will write and be resonsible for enacting the program. We'll come back to this method in a bit. 
* Write a method, `.help` that puts out the list of commands to the terminal. The commands are: 
    * help 
    * list
    * play
    * exit
* Write a `.get_input` method that `puts` "Enter a command:" and uses `gets.chomp` to store the user's input in an instance method `.input`. 
* Write a method, `.do_command` that calls on `.get_input` and uses control flow to invoke the appropriate method (i.e. `.help`, `.list` or `.play`) depending on the user's input. 
* Write a method, `.list` that uses the `songs` instance method to `puts` out a the list of songs. Look at the spec file to understand the desired format of the songs list. **Hint:** use the `.each_with_index` method to help you output the songs in a numbered list. 
* Write a method '.play' that does the following: 
    * asks the user to input a song number or title with the following prompt: `"Enter a song number or enter the artist and song title, as shown in the list above"`.
    * uses `gets.chomp` to store the user's response to the above question.
    * if the user's response is a number that is contained in the list of songs (i.e. if the list of songs goes from 1-7 then the number the user inputs must be between 1 and 7), `puts` out "Now playing: <Artist Name> - <Song Name>"
    * if the user's response is a song name included in the list of songs, `puts` out "Now playing: <Artist Name> - <Song Name>"
    * otherwise, `puts` out "sorry, please enter a valid song or type 'help' for more options."
* Return to the `.call` method. The call method should welcome the user with a the following message: `"Welcome to the Jukebox! Type 'help' to see the list of available commands"` and continue to execute `.do_command` while the user's input doesn't equal "exit."

**Top-Tip:** Interact with your app to get it working properly! Run the app with `ruby bin/jukebox` in the terminal to checkout it's functionality as you go. Pair running the app with running the test suite and reading the test output. Going back and forth between the two is a good workflow.

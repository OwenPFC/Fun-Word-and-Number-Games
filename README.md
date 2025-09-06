# A Collection of Fun Word and Number Games

This collection was made in **one week** for the University at Buffalo Game Development Club Spring Game Jam.
The theme for this jam was "invert a game trope". So, we ran with the idea of turning very intelligent, calming thinking games from the New York Times, and turning them into overstimulating, overcomplicated clownlike games

I made this game with my friend [Liza](https://github.com/elysy-dev), making this my first ever collaborative project!

# The Games in the Collection

* **Sudoku:** Developed by Liza, this is your classic Sudoku puzzle... but it spins!!!! And it has Roman Numerals. Very scary stuff. For a more in depth look, please see her [Sudoku repo](https://github.com/elysy-dev/Sudoku)

* **Connections:** This is a classic New York Times Connections... except with a huge twist. If I told you the twist it would ruin the whole point. So give it a shot.
  
* **Crossword:** This is a play on the Mini Crossword, where **every single letter** has a clue associated with it. This one's my golden boy, it's absolutely genius and revolutionary puzzle design.

* **Wordsearch:** This one is odd. It's not an NYT game, I just thought it was an interesting idea. It's a wordsearch, but you have to excavate the words by removing letters from the puzzle that aren't associated with the words. It's really difficult and unbalanced... but at least the music is great!

# Technical Notes

This project heavily utilized **object oriented programming principles** to make it not a total nightmare to develop.
  * Wordsearch has ~150 button elements associated with it, BUT, they can be broken down into 2 distinct types: associated with a word, not associated with a word. So for these 150 buttons, I only really needed to make 2, and then I could just keep instantiating them and giving each child different letters to display.

    * This was done for the connections as well. I think OOP is awesome and should always be used when possible, but it is particularly useful when under a time crunch

In general, keeping a solid hierarchy for all of my scenes was crucial for a smooth development process, since almost everything on the screen is a ui element and needs to be in proportion with the other ones. I did NOT do this for the crossword which made me very sad when I had to resize all of the ui elements... I had to do it all individually.

As this was a collaborative effort, we used Github for our version control and file sharing... this led to many disastrous merges which erased a lot of progress. We got there. Eventually. (We definitely didn't lose an entire half of a mini game 15 minutes before final submissions)

You may also notice if for some reason you're looking at my projects in chronological order, the file organization is getting better! Still not great, but look at all of those files. It's beautiful.

# dice-analyzer
Analyze dice-roll systems, particularly those for Role-Playing Game character generation

Many RPG's use dice rolls to allocate character stat generation. Two example systems are:
* 4d6, sum the top 3
* 3d4 + 5

Which system do you choose? What do they look like, statistically? This simple set of code is designed to help answer that question.

Once you source rdice.r in R, you can call any of the functions to generate dice rolls and/or graph them.

Functions:

rdice(die, n)
  Rolls n die-sided dice and returns that vector

combmax(numbers, maxed)
  Takes a vector "numbers", returns the n-highest (where n=maxed)

multimax(die, num_dice, maxed, iter)
  Generates "num_dice" dice with "die" sides, finds their n-highest (n="maxed"), repeats this process "iter" times, returning a "maxed"-by-"iter" array

summax(die, num_dice, maxed)
  Generates a sum of dice rolls, excluding rolls other than the n-highest (n="maxed")

gendice(die, num_dice, maxed, base, iter)
  Generates an array of dice rolls, generated via summax(), adding "base", iterating "iter" times

dicechart(die, num_dice, maxed, base, iter)
  Generates an array of dice rolls via gendice(), then creates a basic histogram of the results

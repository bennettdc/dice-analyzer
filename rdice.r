# Roll n die-sided dice
rdice <- function (die, n)
{
  rolls <- ceiling(runif(n, min=0, max=die))
  return (rolls)
}

# Take <numbers> and find the n-highest.
combmax <- function (numbers, maxed)
{
  highestnums = c()
  for (i in 1:maxed)
  {
    maxnum = max(numbers)
    highestnums = c(highestnums, maxnum)
    for (j in 1:length(numbers))
    {
      if (numbers[j] == maxnum)
      {
        numbers <- numbers[-j]
        break
      }
    }
  }
  return (highestnums)
}

# Find the maximums of several sets of dice
multimax <- function (die, num_dice, maxed, iter)
{
  # rolls = c()
  maxrolls = array(dim = c(maxed,iter))
  for (i in 1:iter)
  {
    rolls <- rdice(die,num_dice)
    maxrolls[,i] <- combmax(rolls,maxed)
  }
  return (maxrolls)
}

# Sum a certain number of highest die rolls
summax <- function (die, num_dice, maxed)
{
  # rolls = c()
  maxrolls = array(dim = maxed)
  rolls <- rdice(die,num_dice)
  maxrolls <- combmax(rolls,maxed)
  sum_maxs <- sum(maxrolls)
  return (sum_maxs)
}

# Generate a pool of dice rolls
gendice <- function (die, num_dice, maxed, base, iter)
{
  sum_maxs = array(dim=iter)
  for (i in 1:iter)
  {
    sum_maxs[i] <- (summax(die,num_dice,maxed)+base)
  }
  return (sum_maxs)
}

# Generate a histogram of a die roll system
dicechart <- function (die, num_dice, maxed, base, iter)
{
  dierolls = gendice(die, num_dice, maxed, base, iter)
  lowest = min(dierolls)
  highest = max(dierolls)
  columns = c()
  for (i in lowest:(highest+1))
  {
    columns = c(columns,i)
  }
  hist(dierolls, breaks = columns, freq = FALSE, right = FALSE)
}


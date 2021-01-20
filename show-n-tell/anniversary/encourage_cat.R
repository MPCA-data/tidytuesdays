# An encouragement kitty that is sometimes punny
## Add your name for a personalized message

encourage_cat <- function(name = "", cat = T) {
  
  #install.packages("cowsay")
  #library(cowsay)
  
  quotes <- c("I do declare. You are officially awesome at this.",
              "Keep going!",
              "All that hard work is paying off!",
              "You are quite good my friend!",
              "You are on a roll.",
              "Excellently done!",
              "Keep the streak going.",
              "You are unstoppable.",
              "Meow meow!",
              "You're making your teachers proud.",
              "You have serious R skills.",
              "That was nicely done.",
              "You are on your way.",
              "Wow! Great job!",
              "My pet chicken says you're Eggsellent!",
              "Keep being amazing!",
              "You're on fire!",
              "That was purrfect!",
              "You are too good. Let's paws for a moment and appreciate your greatness.",        
              "Great job! Fur real!",
              "You sure aren't kitten around! Great work!",
              "Nothing gives you paws.",
              "R you feline fine after that exercise?",
              "You are a catalyst for success!",
              "Breaking Meows! You rock!",
              "Not too shabby for a tabby!",
              "Way to dig your claws in!",
              "You are the whole kitten-kaboodle."
              )
  
  # Get random encouragement
  quote <- sample(quotes, 1)

  # Print to screen
  if (cat) {
    
    back_cat <-' \n -----------------------------
        \u005c
         \u005c
          \u005c
            \u007c\u005c___/\u007c
            )     (
           =\\\     /=
             )===(
            /     \u005c
            |     |
           /       \u005c
           \u005c       /
      jgs   \u005c__  _/
              ( (
               ) )
              (_('
    
    if (nchar(name) > 0) {
      return(cat(paste0("\n Meow-meow ", name, ". ", quote, back_cat)))
    }
    
    return(cat(paste0("\n Meow-meow. ", quote, back_cat)))
  }
  
  return(cat(paste0("\n ", quote))) 
}


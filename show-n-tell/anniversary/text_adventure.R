## Tenliner Cace Adventure by Einar Saukas
## Ported from ZX81 BASIC to R by Peter Prevos



# Player options
#
# north
# south
# east
# west
#
# look
# open **
# take **
# fight **
# inventory

## Helper functions to keep syntax close to ZX81
val <- function(p) as.numeric(p)

get_state <- function(p, q = p) substr(game_state, p, q)

## Ported ZX81 code
game_state <- "100"  # The first number is the room number, #1 is the starting room - The Cave

responses <- data.frame(text = c(
                             "... Sorry, but you cannot.",
                             "... You walk slowly. Your foot still aches.",
                             " *opened* ",
                             " *closed* ",
                             "( There is a sword. The handle sparkles and then goes dark. )",
                             "( There is a key with a small snake etched onto its back. )",
                             "( There is nothing here. )",
                             "... You see a metal chest. ",
                             "... You see a dragon. It is not happy. ",
                             "... You see a boot fit for a large left foot. That is strange.",
                             " *taken* ",
                             "... You fought valiantly but were defeated. You shall be remembered. Briefly.",
                             " You are victorious! Your name will be remembered for all eternity. Or at least until you close R.\n\n"),
                        stringsAsFactors = F)

rooms <- data.frame(room_n   = 1:4,
                    room_desc = c("cave", "pit", "hall. You hear a light breeze, or maybe it is breathing", "lake"),
                    stringsAsFactors = F)

cat("\n\n\n\n\n\n\n\n\n\n\n\n")
cat("#---------------------------------------------------------------#\n#\n")
cat("# You awake and your eyes begin to adjust to the darkness. \n#\n# Ouch! Your left ankle sparks with pain. \n#\n# You look around you.")
cat("\n#\n")
cat("#")

repeat {

  cat("\n\n > You are standing in a ")

  cat(rooms[val(get_state(1)), ]$room_desc)

  cat("...  \n\n")

  # Get user input
  u <- tolower(readline(prompt = "| What do you do (north-south-east-west or look-take-open-fight-inventory)?  "))

  m <- 2 * (u == "north") * (get_state(1) < "3") -
       2 * (u == "south") * (get_state(1) > "2") +
           (get_state(1) == "2" & u == "west") -
           (get_state(1) == "3" & u == "east")

  a <- (3 * val(get_state(2)) + 2 * (get_state(3) == "2")) * (get_state(1) == 2 & u == "look") +
       (11 + (get_state(3) == "2")) * (get_state(1) == "3" & u == "fight") +
       (m != 0) +
       (5 + val(get_state(1))) * (u == "look") +
       (6 - val(get_state(3))) * (u == "inventory") +
       (6 - (get_state(3) == "0")) * (get_state(1) == 4 & u == "look") +
       10 * (get_state(1, 3) == "400" & u == "take") +
       2 * (get_state(1, 3) == "201" & u == "open") +
       10 * (get_state(1, 3) == "211" & u == "take") +
       1 * (get_state(1, 3) == "211" & u == "look")

  # Update room and game status
  game_state <- paste0(val(get_state(1)) + m, val(get_state(2)) + (a == 2), val(get_state(3)) + (a == 10))

  cat(paste("\n", responses[a+1, ]))

  if (a >= 11) {

    i <- tolower(readline(prompt = "     > Enter your hero's name:   "))

    cat(paste0("\n", i, ", wielder of 1,000 faces once stood here.\n\n\n\nTHE END\n\n"))

    break
  }

}


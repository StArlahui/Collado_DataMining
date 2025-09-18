signal <- "yellow"
result <- switch(signal,
                 "red" = "Stop",
                 "yellow" = "Ready",
                 "green" = "Go",
                 "Invalid signal"  # default case
)
print(result)

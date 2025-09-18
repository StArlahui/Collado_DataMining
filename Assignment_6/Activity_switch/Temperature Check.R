temp <- c(32, 35, 29, 40, 38)
if (all(temp >= 30)) {
  print("all days were hot")
}
if (any(temp < 30)) {
  print("at least one day was below 30")
}

nums <- c(2, 4, 5, 8)

if (all(nums %% 2 == 0)) {
  print("all numbers are even")
}
if (any(nums %% 2 == 0)) {
  print("at least one number is even")
}

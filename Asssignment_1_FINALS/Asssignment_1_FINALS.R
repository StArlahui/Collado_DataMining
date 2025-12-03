library(arules)


data("Groceries") # load dataset

summary(Groceries) # check dataset summary
inspect(head(Groceries, 5)) # show first few transactions

frequent_items <- apriori(Groceries, parameter = list(supp = 0.01, target = "frequent itemsets"))
inspect(head(frequent_items))    # show some frequent items

rules_groceries <- apriori(Groceries, 
                           parameter = list(supp = 0.01, conf = 0.5))  # generate rules

rules_lift_groceries <- sort(rules_groceries, by = "lift", decreasing = TRUE)   # sort rules

print("Top 10 Rules for Groceries (Sorted by Lift):")
inspect(head(rules_lift_groceries, 10))   # show top 10 rules

library(arulesViz)
plot(head(rules_lift_synthetic, 20), method = "graph")

# Scatterplot Visualization
plot(rules_synthetic, method = "scatterplot", jitter = 0)
plot(rules_groceries, method = "scatterplot", main = "Scatterplot of Rules (Groceries)")

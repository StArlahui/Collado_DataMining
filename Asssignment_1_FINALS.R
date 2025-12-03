library(arules)


data("Groceries")

summary(Groceries)
inspect(head(Groceries, 5)) 

frequent_items <- apriori(Groceries, parameter = list(supp = 0.01, target = "frequent itemsets"))
inspect(head(frequent_items))

rules_groceries <- apriori(Groceries, 
                           parameter = list(supp = 0.01, conf = 0.5))

rules_lift_groceries <- sort(rules_groceries, by = "lift", decreasing = TRUE)

print("Top 10 Rules for Groceries (Sorted by Lift):")
inspect(head(rules_lift_groceries, 10))

library(arulesViz)
plot(head(rules_lift_synthetic, 20), method = "graph")

# Scatterplot Visualization
plot(rules_synthetic, method = "scatterplot", jitter = 0)
plot(rules_groceries, method = "scatterplot", main = "Scatterplot of Rules (Groceries)")
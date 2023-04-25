#topic 5a

library(arules) #must be installed

appstrans = read.transactions('application_data.csv', format='basket',sep=',',rm.duplicates=FALSE)

print(appstrans@itemInfo)

#topic 5b
print(summary(appstrans))

#topcic 5c
itemFrequencyPlot(appstrans, topN=10)

#topcic 5d
#run apriori with the given parameters.
rules = apriori(appstrans, parameter=list(support=0.25, confidence=0.8, minlen=2))

#sort by support
rules_by_sup = sort(rules, by = 'support')

inspect(head(rules_by_sup,4))

print(summary(rules))


#topic 5e
#create vector where true is for the rules where "Instagram" in on rhs
insta_vector = rhs(rules) %in% 'Instagram'

#print the lhs of these rules
inspect(lhs(rules)[insta_vector])

library(arulesViz)
plot(rules, method='paracoord')



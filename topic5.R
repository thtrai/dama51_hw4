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
itemsets = apriori(appstrans, parameter=list(support=0.25, confidence=0.8, minlen=2))

#sort by support
itemsets_by_sup = sort(itemsets, by = 'support')

inspect(head(itemsets_by_sup,4))

print(summary(itemsets))


#topic 5e
#create vector where true is for the rules where "Instagram" in on rhs
insta_vector = rhs(itemsets) %in% 'Instagram'

#print the lhs of these rules
inspect(lhs(itemsets)[insta_vector])

library(arulesViz)
plot(itemsets, method='paracoord')



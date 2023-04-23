#topic 5a

library(arules) #must be installed

appstrans = read.transactions('application_data.csv', format='basket',sep=',',rm.duplicates=FALSE)

print(appstrans@itemInfo)

#topic 5b
print(summary(appstrans))

#topcic 5c
itemFrequencyPlot(appstrans, topN=10)




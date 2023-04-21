#import seeds data and run set.seed as stated in topic
set.seed(123)
seeds_orig = read.csv('seeds_dataset.csv', header=T)

#find the column numbers of seeID,seedType to remove them
rm_cols = which(colnames(seeds_orig) %in% c('seeID', 'seedType'))
print(rm_cols)

seeds = seeds_orig[,-rm_cols] #seeds without seeID and seedType columns

scseeds = scale(seeds) #scale seeds
print(class(scseeds)) #check the type of scseeds is a matrix

scseeds = as.data.frame(scseeds) #convert it to data frame

print(sapply(scseeds, mean)) #indeed the mean is 0, (very close to zero due to rounding errors) for every attribute 
print(sapply(scseeds, sd)) #indeed the standard deviation is 1 for every attribute

c = kmeans(scseeds, 3, nstart=25) #apply kmeans algorithm to scseeds with 3 centers and nstart 25!!!!!!!!!!!!!!! 

#print centroids perimeter, rounded 
print(round(c$centers[,'perimeter'],3))

#print the clusters which belong the data of rows 9,55,189 respectively
print(c$cluster[c(9,55,189)])

#print the euclidean distance of the centroids, rounded

print(round(dist(c$centers, method='euclidean'),3))

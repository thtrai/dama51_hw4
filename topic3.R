#import seeds data and run set.seed as stated in topic
#topic 3a
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

c = kmeans(scseeds, 3) #apply kmeans algorithm to scseeds with 3 centers

#print centroids perimeter, rounded 
print(round(c$centers[,'perimeter'],3))

#print the clusters which belong the data of rows 9,55,189 respectively
print(c$cluster[c(9,55,189)])

#print the euclidean distance of the centroids, rounded

print(round(dist(c$centers, method='euclidean'),3))

#topic 3b
print(c$cluster)
#I can see c$cluster vector has stored the assignments of cluster 2 first.
#I need to rearrange this in a new vector.
#create a new vector to store integers(cluster assignment) of length
#equal to the length of c$cluster
#then rearrange as stated.
rearranged_vector = vector(mode='integer', length=length(c$cluster))

rearranged_vector[c$cluster==2] =1
rearranged_vector[c$cluster==1] =2
rearranged_vector[c$cluster==3] =3

#create the confusion matrix and print it
library('caret')

seedTypeFactor = factor(seeds_orig$seedType)
clusterFactor = factor(rearranged_vector)

conf = confusionMatrix(data=clusterFactor, reference=seedTypeFactor)
print(conf$table)


#topic 3c
library(cluster) #must be installed
library('factoextra') #must be installed

#silhouette coefficients of 3 clusters
sil3 = silhouette(c$cluster, dist(scseeds))
#print the average silhouette of 3 clusters, rounded
print(round(mean(sil3[,3]),3))

#visualize kmenas for k =3 
show(fviz_cluster(c, data=scseeds, main='plot of kmeans with 3 clusters'))

#create clustering with 4 centroids:

set.seed(123)
c4 = kmeans(scseeds,4)

#silhouette of 4 clusters:
sil4 = silhouette(c4$cluster, dist(scseeds))

#print the average silhouette of 4 clusters, rounded
print(round(mean(sil4[,3]),3))

#I confirm the silhouette for 4 clusters is lower

#visualize kmenas for k =4 
show(fviz_cluster(c4, data=scseeds, main='plot of kmeans with 4 clusters'))

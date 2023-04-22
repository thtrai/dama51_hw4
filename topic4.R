#topic 4a
#import europe dataset as europe_orig.
#I can open the csv as text and confirm the fist row is the headers.

europe_orig = read.csv('europe_diet.csv',header=T)

#I will use head to print the first lines of dataset, and inspect import
#I can confirm the first column of the dataset contains the names of the countries.

print(head(europe_orig))


#Since I want to manipulate the data, I will store the dataset to variable europe_orig
europe = europe_orig

#rename the rownames as the name of the countries.
rownames(europe) = europe[,1] 

#delete the first column
europe = europe[,-1]

#topic 4b

#calculate euclidean distance matrix of Greece, Belgium, Spain and Finland, rounded to 3 decimals
distMatrix = round(dist(europe[c('Greece','Spain','Belgium','Finland'),], method='euclidean'),3)

print(distMatrix)

#topic 4c
library(cluster) #must be installed. Contains agnes() function

#distance matrix of europe with euclidean metric
distMatrixFull = dist(europe, method='euclidean')

#since the distance matrix has been created with euclidean metric,
#I don't have to define the metric in agnes() function

#agglomarative cluster using distance matrix, with complete clustering method
cluster_complete = agnes(distMatrixFull, method='complete')

#agglomarative cluster using distance matrix, with single clustering method
cluster_single = agnes(distMatrixFull, method='single')

pltree(cluster_complete)
pltree(cluster_single)

#topic 4d
#create the vector with the 7 group memberships as g, from the 
#previous complete linkage hierarchical clustering

g = cutree(cluster_complete, k=7)

#extract the countries names from distMatrixFull
countries = rownames(as.matrix(distMatrixFull))

#find the index numbers of the countries
index_switz = which(countries == 'Switzerland')
index_norway = which(countries == 'Norway')

#find in which cluster the countries has been assigned
cluster_switz = g[index_switz]
cluster_norway = g[index_norway]

#find the indeces of countries with the same group as Switzerland and Norway
index_group_switz = which(g==cluster_switz)
index_group_norway = which(g==cluster_norway)

#Group with Switzerland
group1 = countries[index_group_switz]
print(group1)

#Group with Norway
group2 = countries[index_group_norway]
print(group2)

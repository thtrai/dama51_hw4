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

print(round(dist(europe[c('Greece','Spain','Belgium','Finland'),], method='euclidean'),3))

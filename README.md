Numerical Methods Course \
HOMEWORK 1 

March, 2020

Bianca Necula \
Faculty of Automatic Control and Computer Science \
315CA 

# Info
```bash
git clone https://github.com/BiancaNecula/Numerical-Methods-Homework.git
```
# About the project
See more info in "Tema 1 - MN.pdf" file.

# About the code
Implementing tasks:

## Task 1:
* Generate probabilities system:
  - I noticed the shape and the rules of the appearance of the elements in the matrix
  -  the matrix is ​​quadratic of the size rows (rows-1) / 2 and the main diagonal represents the inverse of the probabilities of the node of the respective index
  - iterates through the diagonal and sets the values ​​and on each row respectively the node stays -1 in the positions of its neighbors depending on the probability
  - general case of neighbors for a node with 6 outputs: poz + row + 1, poz + row, poz-row, poz-row + 1, poz + 1, poz-1
  - the vector b is created which contains the number 1 on the last rows of positions
* Matrix to csr:
  - the 3 vectors are created iterating through the matrix: values ​​(non-zero values), colind (non-zero value indices), rowptr (pointers to the first elements on each row)
* Jacobi factorization:
  - the algorithm is used for factorization by the Jacobi method on a dense matrix
  - return the iteration matrix G and the iteration vector c
* Jacobi sparse:
- the parameters are used: iteration matrix in CSR form and iteration vector and Jacobi factorization is applied to find the system solution.

## Task 2:
* Clustering:
  - the centroid matrix and a binary matrix of dimension no_points x NC are initialized to remember the initial cluster
  - the cluster is initialized with the formula from the requirement: point_index% NC = i and 1 is added in the binary matrix instead of the centroid points
  - calculate the Euclidean distance from each ounct l all centroid, save in a vector and choose the minimum, representing the new centroid close to the point.
  - the points of each centroid are averaged and the new centroid is chosen
  - 1 is placed in the matrix next to the centroid and is saved at each iteration
  - when the matrix is ​​unchanged from one iteration to another the algorithm stops and we return the centroid
* Cost function:
  - the first part of the aclustering algorithm is repeated and the Euclidean distances are calculated
  - the sum of the minimum distances for each point is calculated

## Task 3:
* RGB Histogram:
  - read the image from the given path as a parameter, extract the representative matrices for each color from each pixel
  - the channels for each color are calculated according to the formula: color * count_bins / 256
  - the acumarray function is used to represent the values ​​of the colors depending on their appearance
  - do this for the 3 colors and concatenate the output at the end
* HSV Histogram:
  - transform the image from RGB to HSV through the written RGB2HSV function vectorized according to the algorithm in the requirement
  - follow the steps from RGB Histogram, only that in the formula instead of / 256 appears /1.01 to separate the data properly and because the color matrices will be in the range [0,1]
* Preprocess:
  - select images from the / cats and / not-cats folders
  - in vector y we put 1 for the positions of the cats images and -1 not_cats
  - in the X matrix will be placed on each line the histograms calculated for each image depending on the given parameter 'RGB' or 'HSV'
* SST:
  - the algorithm for solving a triangular upper system is implemented
* Householder:
  - the QR Householder decomposition algorithm for an A matrix is ​​implemented
* Learn:
  - the X_tilda matrix is ​​made as the X matrix with a bias column
  - calculate Q, R with Householder and find the solution w using SST
* Rated:
  - set X and y for test images
  - y is calculated by multiplying the matrix X by the learned vector w
  - compare the values ​​from the two vectors y and find out how many values ​​in the total are identical
  - this number is returned as a percentage

## Task 4:
* Functions implemented in Task 3
* Learn:
  - X is scaled and X_tilda is built
  - the algorithm given in the request is used to find out w
* Rated:
  - is the same solution as in task 3

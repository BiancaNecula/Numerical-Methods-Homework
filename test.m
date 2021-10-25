%[x, y] = preprocess('dataset/', 'RGB', 16)
path1 = '/home/bianca/Documents/MN_tema1/checker-part-3/dataset/';
path2 = '/home/bianca/Documents/MN_tema1/checker-part-3/testset/';
histogram = "RGB";
count_bins = 20;
[X, y] = preprocess(path1, histogram, count_bins);
[w] = learn(X, y);
[Z] = evaluate(path2, w, histogram, count_bins)


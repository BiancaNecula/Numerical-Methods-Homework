path1 = '/home/bianca/Documents/MN_tema1/checker-part-4/dataset/';
path2 = '/home/bianca/Documents/MN_tema1/checker-part-4/testset/';
histogram = "RGB";
count_bins = 20;
[X, y] = preprocess(path1, histogram, count_bins);
[w] = learn(X, y, 0.01, 500);
[percentage] = evaluate(path2, w, histogram, count_bins)

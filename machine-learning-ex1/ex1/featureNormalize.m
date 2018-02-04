function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly 
%


X_norm = X;
mu = zeros(1, size(X, 2));		%mean row vector 
sigma = zeros(1, size(X, 2));	%std. deviation 

% ====================== YOUR CODE HERE ======================
% Instructions: First, for each feature dimension, compute the mean
%               of the feature and subtract it from the dataset,
%               storing the mean value in mu. Next, compute the 
%               standard deviation of each feature and divide
%               each feature by it's standard deviation, storing
%               the standard deviation in sigma. 
%
%               Note that X is a matrix where each column is a 
%               feature and each row is an example. You need 
%               to perform the normalization separately for 
%               each feature. 

%calculating mean and std. deviation for house size(1) and #bedrooms(2)
meanX1= mean(X(:,1))
stdev1= std(X(:,1))
meanX2= mean(X(:,2))
stdev2= std(X(:,2))

k= size(X) 		%returns the size of X vector 
m= k(1, 1)		%sets m equal to the 1,1th element of k i.e number of rows

for i=1:m
	mu(i, 1)=meanX1;
	mu(i, 2)=meanX2;
end
for i=1:m
	sigma(i, 1)= stdev1;
	sigma(i, 2)= stdev2;
end

X_norm= (X-mu)./sigma;
%
% Hint: You might find the 'mean' and 'std' functions useful.
%    
% ============================================================

end

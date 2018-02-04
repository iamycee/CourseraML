function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%



C_options= [0.01,0.03,0.1,0.3,1,3,10,30];		%as given in pdf
sig_options= [0.01,0.03,0.1,0.3,1,3,10,30];		%as given in pdf

for i= 1: length(C_options)
	
	C= C_options(i);
	
	for j= 1: length(sig_options)
		
		sigma= sig_options(j);
		
		model= svmTrain(X, y,  C, @(x1, x2) gaussianKernel(x1, x2, sigma));
		predictions=  svmPredict(model, Xval);
		error(j)= mean(double(predictions ~= yval));
		
		
		if(j==1)
			%errorJ contains errors for one C vs all sigma 
			errorJ= error(j);	%store first element directly
		else
			errorJ= [errorJ; error(j)]; 	%you gotta append the rest 
		end 
	end	
		
	if(i==1)
		%errorI contains errors for all Cs vs  all sigmas
		errorI= errorJ; %store entire errorJ vector into I initially when i=1
	else
		errorI= [errorI,  errorJ]; 	%append the rest of the C-sigma errors 

end

%finding the minimum error location to return corresponding C and sigma
%find( vector == min(vector) ) returns a vector of indices of min elements 

[row,col]=find(errorI==min(min(errorI)));		%find the location row, col of the min element  
%C vs sigma stored in cols 
C= C_options(col);
sigma= sig_options(row); 





% =========================================================================

end

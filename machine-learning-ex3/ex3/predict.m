function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

%adjust X to be 5000x401 by adding ones

X= [ones(m, 1), X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
%~YC
%We need to find h1 and h2 ie the hypothesis for layer1 and 2. 

z1= X*Theta1';
h1= sigmoid(z1);

%mapping from layer 1 to layer 2:
%adding bias ones(m, 1) to h1:

h1=[ones(m, 1) h1];
z2= h1*Theta2';
h2= sigmoid(z2);
%sigmoid basically converts z2 to values between 0 and 1

[highestVal, p]= max(h2, [],  2);	%returns highestVal and it's index in 'p', function predict.m returns the index. 





% =========================================================================


end

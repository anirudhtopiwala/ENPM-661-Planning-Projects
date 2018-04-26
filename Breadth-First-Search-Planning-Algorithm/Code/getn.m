function [n]= getn(x,y)
% This function is used to generate a unique ID for each node. The way it
% works, is by using a bijective function. To read more on bijective
% functions, go to this link https://en.wikipedia.org/wiki/Bijection

n= (x+y)*(x+y+1)+y;

end
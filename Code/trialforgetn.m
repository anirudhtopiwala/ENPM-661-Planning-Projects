
% this is just to check if the bijective function does generate unique
% numbers for our set of values.
k=1;yay=0;
for i=1:1:500
    for j=1:1:500
     v(k)= getn(i,j);
     k=k+1;
    end
end

if (length(v) == length(unique(v)))
yay=1;
end
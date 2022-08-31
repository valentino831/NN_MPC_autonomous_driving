function [id1,id2]=min_distance(setA,setB)

[nrowsA,~] = size(setA);
[nrowsB,~] = size(setB);

% Takes all the possibile distances in terms of 1st and 2nd components
% (x,y)

sqrd_dists =  (repmat(setA(:,1)',nrowsA,1) - repmat(setB(:,1),1,nrowsB)).^2 + ...
              (repmat(setA(:,2)',nrowsA,1) - repmat(setB(:,2),1,nrowsB)).^2;

% sorts the distances and keep in memory the order
[~,index]=sort(sqrd_dists(:));

% take the reminder (resto) from the division min_index/nrowsA
r = rem(index(1),nrowsA);

q = ((index(1)-r)/nrowsA)+1;

id2 = nrowsA*(r==0)+r*(~(r==0));
id1=(q-1)*(r==0)+q*(~(r==0));


end
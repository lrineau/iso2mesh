function newedge=orderloopedge(edge)

% can not process bifercation

ne=size(edge,1);
newedge=zeros(size(edge));
newedge(1,:)=edge(1,:);

for i=2:ne
  [row,col]=find(edge(i:end,:)==newedge(i-1,2));
  if(length(row)==1) % loop node
     newedge(i,:)=[newedge(i-1,2),edge(row+i-1,3-col)];
     edge([i,row+i-1],:)=edge([row+i-1,i],:);
  elseif (length(row)>=2)
     error('bifercation is found,exit\n');
  elseif (length(row)==0)
     error('open curve\n');
  end
end
     

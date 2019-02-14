% A function to Generate random walks in a tetrahedral lattice.

function points = randomwalks3d(N)
   x = 0;												 % Random walks start at 	
   y = 0;												 % the origin.
   z = 0;
   walker = [];

    for j = 1:N
    walker = [walker;x y z];    					 % Build up history
    neighbours = [x+1 y-1 z+1;x-1 y+1 z+1;x-1 y-1 z-1;x+1 y+1 z-1];			 % 4 neighbours
     
    [nrows,ncols] = size(neighbours);				 % nrows options for jump
                
 	    k = 1 + floor(nrows*rand);
        x = neighbours(k,1);
        y = neighbours(k,2);
        z = neighbours(k,3);
       
 
    end
    points = walker;
end
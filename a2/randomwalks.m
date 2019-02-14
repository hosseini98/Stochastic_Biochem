    % A function to generate self-avoiding Random walks in 3D

function points = randomwalks(N)

    % Random walks start at the origion.
    x = 0;												 	
    y = 0;												 
    z = 0;
  
    % points Builds up the coordiante vector of all steps that random walker goes through.
    points = [];

    for j = 1:N
    points = [points;x y z]; 
    % There are 6 neighbours around each point. 
    neighbours = [x+1 y z;x-1 y z;x y+1 z;x y-1 z; x y z+1; x y z-1];	
    % setdiff recognizes the neighbours which have not visited yet
    destination = setdiff(neighbours,points,'rows'); 
    
    % nrows is the options for jump
    [nrows,ncols] = size(destination);				 
        if (nrows ~= 0)         
 	    k = 1 + floor(nrows*rand);
        x = destination(k,1);
        y = destination(k,2);
        z = destination(k,3);
        end
  

    end
    

    
end

function Rg_r = Radius_gyration(N)       % Function for calculating the Radius of gyration

 points = randomwalks(N); % coordiante vector of all steps of a random walker
 
 mean_points=mean(points); % the mean value of components (x,y,z) of all steps 
 
 Rg2=mean((points-repmat(mean_points,[N 1])).^2);   
 
 Rg_r = sqrt(sum(Rg2)); % Radoius of gyration for N-step random walk.
           

end
        
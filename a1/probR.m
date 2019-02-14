% Here, we show that a walker starting from the origin in a 
%tetrahedral lattice never returns. If we calculate the
%probability of having random walk at different radii,  we can see that
%this probability is very small at smaller radii  and it sharply increases as
%raduis increases.
%


%initial values
N     = 100;         % Number of steps in each random walk.
M     = 10000;      % Number of Random walks.
 
R     = zeros(1,M); %The distance of a random walk from the origin in its last step.
p     = zeros(1,N); % p shows the number of random walks inside the radius.
prob  = zeros(1,N); % probability of having p random walk from the total of M random walks to be inside the radius r.


     %In this loop, I obtain the distance of random walks from the origin. 
 for i=1:M
                  
        points= randomwalks3d(N);   % a function to generate random walks.
        
        R(i)=sqrt(points(N,1)^2+points(N,2)^2+points(N,3)^2);
 end
    %hist(R)
    
 
    
for r=1:N 
    % p(r) shows the number of random walks inside the radius r (r changes from 1 to N).
     p(r)=numel(R(R<r));
     prob(r)=p(r)/M;

end

     plot(1:N,prob,'r-')       %plot of probability against radius.
     xlabel('r','fontsize',18)
     ylabel('probability','fontsize',18)
     
     

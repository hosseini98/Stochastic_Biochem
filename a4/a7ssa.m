%Stochastic simulation algorithm for three-stage model of gene expression
%


%%%Order of reactions

    % 1: inactive promoter -> active promotor  ------- c(1)=k0
    % 2: active promotor   -> inactive promoter------- c(2)=k1
    % 3: active promoter   -> mRNA-------------------- c(3)=nu0
    % 4: mRNA              -> protein----------------- c(4)=nu1
    % 5: mRNA              -> 0 (degradation)--------- c(5)=d0
    % 6: RNA               -> 0 (degradation)--------- c(6)=d1


%%%Stoichiometric matrix 
V = [-1 1 0 0; 1 -1 0 0; 0 0 1 0; 0 0 0 1; 0 0 -1 0; 0 0 0 -1];
nu=transpose(V);
%%%parameters and initial conditions
d1=0.0005;
d0=0.0005;

X = zeros(4,1);
 
X(1) = 1; % X(1) molecules of inactive promoter
X(2) = 0; % X(2) molecules of active promoter 
          % X(3) molequles of mRNA
          % X(4) molequles of protein


c(1) = 0.06*d1; c(2) = 0.02*d1; c(3) = 4*d1;c(4)=10*d0; c(5)=d0; c(6)=d1;

t = 0;
tmax = 50000000;


tvals(1) = 0;
Xvals(:,1) = X;



storage_increment=tmax/10000;
tstore(1)=0;
n=1;

while t < tmax
     a(1) = c(1)*X(1);
     a(2) = c(2)*X(2);
     a(3) = c(3)*X(2);
     a(4) = c(4)*X(3);
     a(5) = c(5)*X(3);
     a(6) = c(6)*X(4);
    
     sum_a=cumsum(a);
     r=rand(2,1); 
     r2a0=r(2)*sum_a(6);
     
     j = find(sum_a > r2a0, 1,'first');
 
     X = X + nu(:,j);
   
     tau = (log(1/r(1)))/sum_a(6);
      t = t + tau;
   
      if t> tstore(n)+storage_increment;
          n=n+1;
            
          tstore(n)= tstore(n-1)+ storage_increment;
          
    
        
          Xvals(:,n) = X;
      end
     
    
end 
%%%%%%%%%%% Plots

 %plot(tstore,Xvals(4,:))
hist(Xvals(4,:),500)


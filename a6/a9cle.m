%CLE_MM.M
%
% Simulation of the Chemical Langevin Equation for a simple model 
% of enzymes modification.
%


randn('state',100)

%order of reactions

    % 1: E+E -> E2   ------- c(1)=k1/nA*L
    % 2: E2  -> E*E  ------- c(2)=k2
    % 3: E*E -> E*2  ------- c(3)=k3
    % 4: E*2 -> E+E  ------- c(4)=k4     
 


%stoichiometric matrix
V1 = [-2 1 0 0; 0 -1 1 0; 0 0 -1 1; 2 0 0 -1];
V=transpose(V1);

%Parameters and Initial Conditions 
nA = 6.023e23;             % Avagadro's number
vol = 1e-15;               % volume of system
Y = zeros(4,1);

Y(1) = round(1e-6*nA*vol); % molecules of enzyme 
c(1) = 1e6/(nA*vol); c(2) = 10; c(3) = 100; c(4)=3;

tfinal = 10;
L = 25000000;
tau = tfinal/L;    % stepsize

Yvals = zeros(4,L+1);
Yvals(1,1) = Y(1);


for k = 1:L
     a(1) = c(1)*Y(1)*Y(1)/2;
     a(2) = c(2)*Y(2);
     a(3) = c(3)*Y(3);
     a(4) = c(4)*Y(4);
     
     d(1) = tau*a(1) + sqrt(abs(tau*a(1)))*randn;
     d(2) = tau*a(2) + sqrt(abs(tau*a(2)))*randn;
     d(3) = tau*a(3) + sqrt(abs(tau*a(3)))*randn;
     d(4) = tau*a(4) + sqrt(abs(tau*a(4)))*randn;
     Y = Y + d(1)*V(:,1) + d(2)*V(:,2) + d(3)*V(:,3)+ d(4)*V(:,4);

     
     Yvals(:,k+1) = Y;
    
end

tvals = [0:tau:tfinal];
plot(tvals,Yvals(4,:)/(nA*vol));




%A numerical solution of SDEs for a damped harmonic oscillator with added
%noise.
%Method:  Euler-Maruyama method on linear SDE
%
% SDE is  dV = -(k/m) * X dt - (f/m) * V dt + (epsilon/m) * dW,   X(0) = Xzero,
%      where k = 1,  m= 1 , f=1 and Xzero = 1.
%


randn('state',100)

%%% parameters
Xzero = 1;
Vzero = 0;
k = 1;  m = 1 ; f=0.1;  
epsilon =100; 
T = 200; N = 2^25; dt = T/N;         
dW = sqrt(dt)*randn(1,N);         % Brownian increments


R = 4; Dt = R*dt; L = N/R;        % L EM steps of size Dt = R*dt
Xem = zeros(1,L);             
Xtemp = Xzero;
Vem = zeros(1,L);                
Vtemp = Xzero;

    
    for j = 1:L
    
        Winc = sum(dW(R*(j-1)+1:R*j)); 
        Vtemp = Vtemp + ((-k*Xtemp-f*Vtemp)*Dt/m)+ (Winc*epsilon/m);
        Xtemp = Xtemp + Dt*Vtemp;
        Xem(j) = Xtemp;
        Vem(j) = Vtemp;
    end

%%%---Plots

%plot([0:Dt:T],[Vzero,Vem],'m-'), hold on
plot([0:Dt:T],[Xzero,Xem],'r-'), hold off
xlabel('t','FontSize',12)
ylabel('x','FontSize',16,'Rotation',0,'HorizontalAlignment','right')




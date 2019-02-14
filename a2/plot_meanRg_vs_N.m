%Here, we get the mean radius of gyration for different values of N. Then, we
%plot the mean radius of gyration against N. 
clear; 
w = input('Enter the number of random walks(w) =');
N = input('Enter the number of steps to be taken by each walker(N) =');


Mean_Rg=zeros(1,N);
mean_radius_gyration = zeros(1,N);

     
for j = 1:N
     
     mean_radius_gyration(j)= meanRg(j,w);
     
end

plot( 1:N,mean_radius_gyration );

%I have plotted mean Rg vs. N for different values of w.

% I did a power fit for one of figures of Rg-N to see how the radius of gyration
% changes with N. I got this: Rg ~ N^0.2827. It is a little different with
% what we see in the literature (Rg ~ N^0.5).
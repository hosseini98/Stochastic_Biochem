
%A function to generate the average of radius of gyration for w  random walks 
function mean_radius_gyration= meanRg(N,w) 
 

    Rg_r    = zeros(1,w);
    Mean_Rg = zeros(1,w);
 
       
for j = 1:w
     
     Rg_r(j) = Radius_gyration(N);
     Mean_Rg(j)  = Mean_Rg(j)+(sqrt(Rg_r(j)))/w;
end

mean_radius_gyration=Mean_Rg(w);
end
  
%plot(NN, Rg_r);

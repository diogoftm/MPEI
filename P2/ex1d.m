f = rand(2, 1000)>0.5;
s = length(f);

%% metedo 1
r=f(1,:);
fprintf("%f", sum(sum(f)==2)/sum(r));

%% metedo 2
rapaz_1 = 0;
rapaz_2 = 0;
for c = 1:s
   if f(1, c) == 1 
       rapaz_1 = rapaz_1 + 1;
       if f(2, c) == 1
            rapaz_2 = rapaz_2 + 1;
       end
   end
end
prob = rapaz_2 / rapaz_1;
fprintf("%f", prob);


NumRows = 25;
NumCols = 25;
FracFull = 0.6;
gravity = 0;
plotevery = 100;
TheReactor = zeros(NumRows,NumCols);
TheReactor(round((1-FracFull)*NumRows):end,:) = 1;
figure(gcf);
clf

imshow(~TheReactor,'InitialMagnification',2000);

if 1  
    
 for ii = 1:1000000
 thepixel = [randi(NumRows), randi(NumCols)];
 if (TheReactor(thepixel(1),thepixel(2))==1)
 if ii/plotevery == round(ii/plotevery)
 imshow(~TheReactor,'InitialMagnification',2000);
 
 end
 
 therandstep = [randi(3)-2,randi(3)-2];
 
 x = thepixel(1) + therandstep(1);
 y= thepixel(2) + therandstep(2);
 
 if (x> NumCols) || (y> NumRows)
         continue;
 end
 
 if (x==0) || (y==0)
     continue;
 end
     
 if (TheReactor(x,y) == 1)
     continue;
     
 else 
     TheReactor (thepixel(1),thepixel(2)) = 0;
     TheReactor(x,y)=1;  
 end
 
 end
 end
end
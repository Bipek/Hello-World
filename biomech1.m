i=1;
Wleg=100;
rleg=0.01;
R=600;
W=500;
rR=0.06;
rm=0.05;
wsuitcase=100;
rw=0.31;
rw2=0.14;
w(i)=wsuitcase;

while (i<50)
    fm = (((Wleg*rleg)+(W*rR)+(wsuitcase*rw))/(rm*sin(70)));
    store(i)= fm;
    y=store;
     fjx(i)= fm*cos(70);
     fjy(i)= (wsuitcase+W+Wleg+(fm*sin(70)));
     
    fm2 = (((Wleg*rleg)+(W*rR)+(wsuitcase*rw)-(wsuitcase*rw2))/(rm*sin(70)));
    store2(i)= fm;
    y2=store;
     fjxx(i)= fm2*cos(70);
     fjyx(i)= (((2*wsuitcase)+W+Wleg+(fm2*sin(70))));
     
     
     wsuitcase = wsuitcase+100;
      w(i)=wsuitcase;
      x=w;
     
    i=i+1;
end

r=atand(fjy/fjx);

Fj= sqrt((fjx.^2) + (fjy.^2));

Fj2= sqrt((fjxx.^2) + (fjyx.^2));


figure(1);
plot(x,Fj,'b');
figure (2);
plot(x,Fj2,'r');


 

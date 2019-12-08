h = input('INPUT INITIAL HEIGHT(m): '); %height at which the projectile was fired
V = input('INPUT INITIAL VELOCITY(m/s): '); %no negative velocity
a = input('INPUT ANGLE (IN DEGREES) WITH RESPECT TO THE +X-AXIS AT WHICH THE PROJECTILE IS FIRED: ');
Ax = input('INPUT ACCELERATION IN THE X-COMPONENT(m/s^2): '); %considering the sign
Ay = input('INPUT ACCELERATION IN THE Y-COMPONENT(m/s^2): '); %considering the sign, it is going down so it needs to be negative


if Ay == 0
    error('VERTICAL ACCELERATION IS ZERO!! THERE WOULD BE NO FREE FALL!!')
end

Vx = V*cosd(a); %initial velocity in x-component
Vy = V*sind(a); %initial velocity in y-component

rt = [(Ay/2),Vy,h];
tm = max(roots(rt));
r = 0:0.01:tm+1;    
X = zeros(1,length(r)+1);
Y = zeros(1,length(r)+1);

t=0.01;
X(1)=0;
Y(1)=h;

for i = 1:length(r)-1
    Xt = ((Ax*(t^2))/2) + (Vx*t);
    Yt = ((Ay*(t^2))/2) + (Vy*t) + h;
    X(i+1) = Xt;
    Y(i+1) = Yt;
    t=t+0.01;
end

X(length(r)+1)=(Ax/2)*tm^2 + Vx*0.01;
Y(length(r)+1)=0;

plot(X,Y,'-m','linewidth',4)
grid 
xlim([0 max(X)])
ylim([0 max(Y)])
title('PROJECTILE MOTION')
xlabel('X')
ylabel('Y')

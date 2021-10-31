%deine gains and Define disatnce of infulience
zeta1=1;
zeta2=1;
eta1=.25;
eta2=.25;
rho0 =1;
K= [.025,.025];
%define obsticale potiton
b=[2;.5];
%Define disatnce of infulience and joint distacne from obsticle
%Set joint Variable
qs = [0;0];
qf = [pi/2;pi/2];
Ohis = [0;2];
temp2 = zeros(4,4,2);
temp = zeros(4,4,2);
%using D-H find the homogenous tranformation for each joint for end
temp2(:,:,1)=HdhRad(1,0,0,qf(1));
temp2(:,:,2)=temp2(:,:,1)*HdhRad(1,0,0,qf(2));
%Get Coordinates for each frame in end position
Of=[temp2(1:2,4,1),temp2(1:2,4,2)];
Os = [1 2;0 0];
endxhis=[2];
endyhis= [0]
while Of(1)-Os(1)<-0.05 || Of(1)-Os(1)>0.05 || Of(2)-Os(2)<-0.05 || Of(2)-Os(2)>0.05
    %using D-H find the homogenous tranformation for each joint for start
    %position

    temp(:,:,1)=HdhRad(1,0,0,qs(1));
    temp(:,:,2)=temp(:,:,1)*HdhRad(1,0,0,qs(2));
    %Jacbian
    hold = eye(4);
    J01= [cross(hold(1:3,3),temp(1:3,4,1)-hold(1:3,4))];
    J02= [cross(hold(1:3,3),temp(1:3,4,2)-hold(1:3,4)),cross(temp(1:3,3,1),temp(1:3,4,2)-temp(1:3,4,1))];
    %Get Coordinates for each frame in start position
    Os=[temp(1:2,4,1),temp(1:2,4,2)];

    %Obtain reppelling forces
    Fatt = zeros(2,2);
    Fatt(:,1)=-zeta1*(Os(:,1)-Of(:,1));
    Fatt(:,2)=-zeta2*(Os(:,2)-Of(:,2));
    %joint distacne from obsticle
    rho = zeros(2,1);
    rho(1) = norm(b-Os(:,1));
    rho(2) = norm(b-Os(:,2));
    %Replulse forces
    Frep = zeros(2,2);
    Frep(:,1) = eta1*(1/rho(1)-1/rho0)*(1/(rho(1)^2))*((Os(:,1)-b)/(norm(Os(:,1)-b)));
    Frep(:,2) = eta2*(1/rho(2)-1/rho0)*(1/(rho(2)^2))*((Os(:,2)-b)/(norm(Os(:,2)-b)));
    %Net Forces for each joint
    F = zeros(3,1);
    F(1:2,1) = Fatt(:,1)+Frep(:,1);
    F(1:2,2) = Fatt(:,2)+Frep(:,2);
    %Joint Torques
    T = J01.'*F(:,1)+J02.'*F(:,2);
    qs(1) = qs(1)+ K(1)*T(1);
    qs(2) = qs(2)+ K(2)*T(2);
    plot([0 Os(1,1) Os(1,2) 2],[0 Os(2,1) Os(2,2) .5],"*")
    axis([-3 3 -3 3])
    hold on
    
    line([0 Os(1,1)],[0 Os(2,1)])
    line([Os(1,1) Os(1,2)],[Os(2,1) Os(2,2)])
    plot(endxhis,endyhis,'-r')
    hold off
    endxhis= [endxhis Os(1,2)];
    endyhis= [endyhis Os(2,2)];
    pause(0.01)
    
end
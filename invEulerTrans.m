function [phi,theta,psi] = invEulerTrans(R)
    if R(1,3)~=0 | R(2,3)~=0
        theta = (180/pi)*atan2(sqrt(1-R(3,3)^2),R(3,3));
        phi = (180/pi)*atan2(R(2,3),R(1,3));
        psi = (180/pi)*atan2(R(3,2),-R(3,1));
    end
    if R(1,3)==0 & R(2,3)==0
        if R(3,3)==1
            theta = 0;
            phi = (180/pi)*atan2(R(2,1),-R(1,1))-psi;
        end
        if R(3,3)==-1
            theta = 180;
            phi = (180/pi)*atan2(R(2,1),-R(1,1))+psi;
        end
    end
end
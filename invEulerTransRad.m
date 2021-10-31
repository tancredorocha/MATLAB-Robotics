function [phi,theta,psi] = invEulerTransRad(R)
    if R(1,3)~=0 | R(2,3)~=0
        theta = atan2(sqrt(1-R(3,3)^2),R(3,3));
        phi = atan2(R(2,3),R(1,3));
        psi = atan2(R(3,2),-R(3,1));
    end
    if R(1,3)==0 & R(2,3)==0
        if R(3,3)==1
            theta = 0;
            phi = atan2(R(2,1),-R(1,1))-psi;
        end
        if R(3,3)==-1
            theta = pi;
            phi = atan2(R(2,1),-R(1,1))+psi;
        end
    end
end
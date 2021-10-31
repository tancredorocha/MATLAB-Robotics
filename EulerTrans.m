function R = EulerTrans(phi, theta,psi)
    R=Rz(phi)*Ry(theta)*Rz(psi);
end

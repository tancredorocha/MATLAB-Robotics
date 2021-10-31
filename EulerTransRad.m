function R = EulerTransRad(phi, theta,psi)
    R=RzRad(phi)*RyRad(theta)*RzRad(psi);
end
function R = AxisAngle(kx,ky,kz,theta)
    s=sin(theta);
    c=cos(theta);
    v=1-c;
    x=[(kx^2)*v+c;kx*ky*v+kz*s;kx*kz*v-ky*s];
    y=[kx*ky*v-kz*s;(ky^2)*v+c;ky*kz*v+kx*s];
    z=[kx*kz*v+ky*s;ky*kz*v-kx*s;(kz^2)*v+c];
    R=[x y z];
end
function H = Hdh(a,d,alp,the)
    H = Hm(Rz(the),dx(0))*Hm(Rz(0),dz(d))*Hm(Rz(0),dx(a))*Hm(Rx(alp),dx(0));
end
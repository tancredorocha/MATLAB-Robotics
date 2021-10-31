function H = HdhRad(a,d,alp,the)
    H = Hm(RzRad(the),dx(0))*Hm(RzRad(0),dz(d))*Hm(RzRad(0),dx(a))*Hm(RxRad(alp),dx(0));
end
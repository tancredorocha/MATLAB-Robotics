function H = FwdKen(DHmat)
    H=sym(eye(4));
    for i = 1:size(DHmat,1)
       H = H*Hdh(DHmat(i,1),DHmat(i,2),DHmat(i,3),DHmat(i,4));
    end
    H=simplify(H);
end

function [J,Hx] = Jacobian(DHmat,type)
    H = sym(zeros(4,4,size(DHmat,1)));
    Hx = sym(zeros(4,4,size(DHmat,1)+1));
    for i = 1:size(DHmat,1)
        H(:,:,i) = simplify(Hdh(DHmat(i,1),DHmat(i,2),DHmat(i,3),DHmat(i,4)));   
    end
    Hx(:,:,1)=eye(4);
    Hx(:,:,2)=H(:,:,1);
    for i = 3:size(DHmat,1)+1
        Hx(:,:,i) = simplify(Hx(:,:,i-1)*H(:,:,i-1));
    end
    
    J= sym(zeros(6,size(DHmat,1)-1));
    for i = 1:size(DHmat,1)-1
        if(type(i)==0)
            J(:,i)=simplify([cross(Hx(1:3,3,i),Hx(1:3,4,size(DHmat,1)+1)-Hx(1:3,4,i));Hx(1:3,3,i)]);
        else
            J(:,i)=simplify([Hx(1:3,3,i);[0;0;0]]);
        end
    end
    J=simplify(J)
end
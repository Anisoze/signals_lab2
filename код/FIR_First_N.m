
function Y_out = FIR_First_N(N, Y, Y_out, a)
    for i=1:N
        s=0;
        for j=1:i
            s=s+a(j)*Y(i-j+1);  
        end
        Y_out(i)=s;
    end
end


function Y_out = IIR_filter(N, Y, Y_out, a, b)
    for i=N+1:length(Y)
        s=0;
        for j=1:N
            s=s+a(j)*Y(i-j+1);  
            if(j>1)
                s=s+b(j)*Y_out(i-j+1);
            end
        end
        Y_out(i)=s;
    end
end
function Y_out = FIR_filter(N, Y, Y_out, a)
    for i=N+1:length(Y)
        s=0;
        for j=1:N
            s=s+a(j)*Y(i-j+1);  
        end
        Y_out(i)=s;
    end
end
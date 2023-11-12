function  x_pad_N =image_padarray(im_r,t)   

   [N1 N2 numDWI]=size(im_r);
   x_pad = padarray(im_r,[t,t],'symmetric'); 

    for i=1:(2*t+1)
        for j=1:(2*t+1)                
            x_pad_N(:,:,i,j,:)=reshape(x_pad(i:N1+i-1,j:N2+j-1,:),[N1 N2 1 1 numDWI]);  
        end
    end
end
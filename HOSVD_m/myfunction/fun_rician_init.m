function [feval grad] = fun_rician_init(x,im_r,sigma,ind)



alpha = (0.5*x/sigma).^2;

tempw = (1+2*alpha).*besseli(0,alpha,1) + 2*alpha.*besseli(1,alpha,1);

sig_NCEXP = sqrt(0.5*pi*sigma*sigma) .* tempw;

tmp = ( sig_NCEXP - im_r).^2;%%%%%%%%��СΪm*n*t*t*ndwi

feval =sum(tmp(ind)) ;%%%%%%%%%%%

%%
if ( nargout >1 )

alpha = (0.5*(x+0.000001)/sigma).^2;

tempw = (1+2*alpha).*besseli(0,alpha,1) + 2*alpha.*besseli(1,alpha,1);

sig_NCEXP1 = sqrt(0.5*pi*sigma*sigma) .* tempw;

A=(sig_NCEXP1-sig_NCEXP)/0.000001;

grad =2*(sig_NCEXP-im_r).*A;
                 
end











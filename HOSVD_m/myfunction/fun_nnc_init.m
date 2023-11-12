function [feval grad] = fun_nnc(x,im_r,sigma,ind,Ncoils)

%%

% [m n ndwi]=size(im_r);

load('pp_initial.mat')
temp1 = 1;
temp2 = 2*Ncoils - 1;
while (temp2 > 1)
    temp1 = temp1 * temp2;
    temp2 = temp2 - 2;
end
temp3 = (2.^(Ncoils-1)) * factorial(Ncoils-1);
temp4 = sqrt(pi/2)*temp1/temp3;



alpha = (0.5*x/sigma).^2;

tempw = (1+2*alpha).*besseli(0,alpha,1) + 2*alpha.*besseli(1,alpha,1);
temp5 = -0.5*(x/sigma).^2;               

% sig_NCEXP = sqrt(0.5*pi*sigma*sigma) .* tempw;

sig_NCEXP = sigma.*temp4.*real(ppval(pp_initial(log2(Ncoils)+1),-temp5));
clear temp5  

tmp = ( sig_NCEXP - im_r(:) ).^2;%%%%%%%%��СΪm*n*t*t*ndwi
% tmp = sum(tmp,5);%%%%%%%%��СΪm*n*t*t
% c1 =tmp.*w1;clear tmp%%%Ȩ��w��СΪm*n*t*t
% c1 = sum(c1,3);  %%%��СΪm*n
% %%%%%%%%%%%%
%  sum(c1(:))
feval =sum(tmp(ind)) ;%%%%%%%%%%%�������� 


%% ����x���ݶ�
if ( nargout >1 )

alpha = (0.5*(x+0.000001)/sigma).^2;

tempw = (1+2*alpha).*besseli(0,alpha,1) + 2*alpha.*besseli(1,alpha,1);

% sig_NCEXP1 = sqrt(0.5*pi*sigma*sigma) .* tempw;


temp5 = -0.5*((x+0.000001)/sigma).^2;               

% sig_NCEXP = sqrt(0.5*pi*sigma*sigma) .* tempw;

sig_NCEXP1 = sigma.*temp4.*real(ppval(pp_initial(log2(Ncoils)+1),-temp5));



A=(sig_NCEXP1-sig_NCEXP)/0.000001;


grad =2*(sig_NCEXP-im_r(:)).*A;
                 
end











function X_hosvd =local_hosvd(X_iter, step,L,sigma,nsigw)
       sweight=zeros(size(X_iter));
       sX=zeros(size(X_iter));  
       [N1 N2 numDWI]=size(X_iter);
%        mX_iter=X_iter-repmat(mean(X_iter,3),[1 1 numDWI]);
       mX_iter=X_iter;
       for ki=1:step:N1
           for kj=1:step:N2
               kki=ki;
               kkj=kj;
               if ki>(N1-L)
                   kki=(N1-L);
               end
               if kj>(N2-L)
                   kkj=(N2-L);
               end
               B=mX_iter(kki:kki+L,kkj:kkj+L,:);
               [Sigma0 U0]   =   hosvd(full(B));
               nsigx =   sqrt(max( Sigma0.^2 - sigma^2, 0 ));
               th =  2*sqrt(2)* nsigw^2./ ( nsigx + eps );%% original 0.6
               Sigma0(find(abs(Sigma0)<th))=0;
               tmp_pre= tprod(Sigma0, U0); 
               sweight(kki:kki+L,kkj:kkj+L,:)=sweight(kki:kki+L,kkj:kkj+L,:)+1;
               sX(kki:kki+L,kkj:kkj+L,:)=sX(kki:kki+L,kkj:kkj+L,:)+tmp_pre;
           end
       end
%        X_hosvd=sX./sweight+repmat(mean(X_iter,3),[1 1 numDWI]);
X_hosvd=sX./sweight;
end
       
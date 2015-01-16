function img=ptr2d(wc,l);

dim=size(wc);
if (size(wc,3)==1)
   img=wc;
   
   for i=1:l,
      
      ii=wc(1:(dim(1)/(2^i)),(dim(2)/(2^i))+1:(dim(2)/(2^(i-1))));
      ii = ii-min(min(ii));
      ii = (ii*255)/max(max(ii));
      min(min(ii))
      max(max(ii))
      img(1:(dim(1)/(2^i)),(dim(2)/(2^i))+1:(dim(2)/(2^(i-1)))) = ii;
      
      ii=wc((dim(1)/(2^i))+1:(dim(1)/(2^(i-1))),1:(dim(2)/(2^i)));
      ii = ii-min(min(ii));
      ii = (ii*255)/max(max(ii));
      img((dim(1)/(2^i))+1:(dim(1)/(2^(i-1))),1:(dim(2)/(2^i))) = ii;
      
      ii=wc((dim(1)/(2^i))+1:(dim(1)/(2^(i-1))),(dim(2)/(2^i))+1:(dim(2)/(2^(i-1))));
      ii = ii-min(min(ii));
      ii = (ii*255)/max(max(ii));
      img((dim(1)/(2^i))+1:(dim(1)/(2^(i-1))),(dim(2)/(2^i))+1:(dim(2)/(2^(i-1)))) = ii;
   end;
   ii=wc(1:(dim(1)/(2^(l))),1:(dim(2)/(2^(l))));
   ii = ii-min(min(ii));
   ii = (ii*255)/max(max(ii));
   img(1:(dim(1)/(2^(l))),1:(dim(2)/(2^(l)))) = ii;
   imagesc(img);
else
   img=wc;
   for i=1:l,
      clear ii
      ii=wc(1:(dim(1)/(2^i)),(dim(2)/(2^i))+1:(dim(2)/(2^(i-1))),:);
      ii=ii+abs(min(min(min(ii))))+1e-003;
      ii=ii./(max(max(max(ii)))+1e-003);
      
      img(1:(dim(1)/(2^i)),(dim(2)/(2^i))+1:(dim(2)/(2^(i-1))),:) = ii;
      
      ii=wc((dim(1)/(2^i))+1:(dim(1)/(2^(i-1))),1:(dim(2)/(2^i)),:);
      ii=ii+abs(min(min(min(ii))))+1e-003;
      ii=ii./(max(max(max(ii)))+1e-003);
      img((dim(1)/(2^i))+1:(dim(1)/(2^(i-1))),1:(dim(2)/(2^i)),:) = ii;
            
       
      ii=wc((dim(1)/(2^i))+1:(dim(1)/(2^(i-1))),(dim(2)/(2^i))+1:(dim(2)/(2^(i-1))),:);
      ii=ii+abs(min(min(min(ii))))+1e-003;
      ii=ii./(max(max(max(ii)))+1e-003);
      img((dim(1)/(2^i))+1:(dim(1)/(2^(i-1))),(dim(2)/(2^i))+1:(dim(2)/(2^(i-1))),:) = ii;
     end;
   ii=wc(1:(dim(1)/(2^(l))),1:(dim(2)/(2^(l))),:);
   ii=ii+abs(min(min(min(ii))))+1e-003;
   ii=ii./(max(max(max(ii)))+1e-003);
   img(1:(dim(1)/(2^(l))),1:(dim(2)/(2^(l))),:) = ii;
   min(min(min(img)))
   max(max(max(img)))
   image(img);
end;

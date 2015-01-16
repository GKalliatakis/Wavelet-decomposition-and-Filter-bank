function h=affiche(img);
%Affichage d'une image
%Display the image

if (size(img,3)==1)
%clf;
if ((img(1,1)==21) & (img(2,2)==21))
   h=image(img);
else
   h=imagesc(img);
end;
colormap(gray);
else
   img=img-min(min(min(img)));
   img=img/max(max(max(img)));
   imagesc(img);
   end;
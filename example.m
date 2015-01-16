%Matlab Example


%Example 1
fe=22000;
t=0:8191;
s=[cos(2*pi*t/64) cos(2*pi*t/2.5) cos(2*pi*t/7)];

figure(1)
fs=abs(fft(s));fs=fs(1:length(fs)/2);
plot((0:length(fs)-1)*(1/length(s)),fs);

figure(2)
plot((0:length(s)-1)/fe,s);
sound(s,fe,16);

%*****************************************
%Example 2: lowpass filter
h = [ 0.111540743350; 0.494623890398; 0.751133908021; 0.315250351709;-0.226264693965;-0.129766867567; 0.09750160558; 0.027522865530; -0.031582039317; 0.000553842201; 0.004777257511; -0.001077301085]';
%h=[0.02667005790099; 0.18817680007791;   0.52720118893175;   0.68845903945367;  0.28117234366087;  -0.24984642432688;  -0.19594627437691;   0.12736934033594;   0.09305736460396;  -0.07139414716597;  -0.02945753682199;   0.03321267405898;  0.00360655356700;  -0.01073317548299;   0.00139535174700;   0.00199240529500;  -0.00068585669500;  -0.00011646685500;   0.00009358867000;  -0.00001326420300]'
%h=h/sqrt(2);

mag=abs(fft(h,2048));
mag=mag(1:1024);

plot((0:length(mag)-1)/2048,mag);

%*****************************************
%Example 3: lowpass filtering
sp=filter(h,1,s);

close all
figure(1)
fs=abs(fft(sp));fs=fs(1:length(fs)/2);
plot((0:length(fs)-1)*(1/length(sp)),fs);


figure(2)
plot((0:length(s)-1)/fe,sp)
sound(sp,fe,16);

%*****************************************
%Example 4: Downsampling
s1=sp(1:2:length(sp));
fe=fe/2;
figure(1);
fs=abs(fft(s1));fs=fs(1:length(fs)/2);
plot((0:length(fs)-1)*(1/length(s1)),fs);

figure(2);
plot((0:length(s1)-1)/fe,s1)
sound(s1,fe,16);

%*****************************************
%Example 5: ReLowpass filtering
sp1=filter(h,1,s1);
figure(1)
fs=abs(fft(sp1));fs=fs(1:length(fs)/2);
plot((0:length(fs)-1)*(1/length(sp1)),fs);

figure(2);
plot((0:length(sp1)-1)/fe,sp1)
sound(sp1,fe,16);

%*****************************************
%Example 6: Construction of the highpass filter

g=h.*power(-1*ones(1,length(h)),(0:length(h)-1));
%g=[ 0.02667005790099  -0.18817680007791   0.52720118893175  -0.68845903945367   0.28117234366087   0.24984642432688  -0.19594627437691  -0.12736934033594   0.09305736460396   0.07139414716597  -0.02945753682199  -0.03321267405898   0.00360655356700   0.01073317548299   0.00139535174700  -0.00199240529500  -0.00068585669500   0.00011646685500   0.00009358867000   0.00001326420300]
%g=g/sqrt(2);

mag=abs(fft(g,2048));
mag=mag(1:1024);

plot((0:length(mag)-1)/2048,mag);




%*****************************************
%Example 7: Highpass filtering
fe=22000
sp=filter(g,1,s);
figure(1)

fs=abs(fft(sp));fs=fs(1:length(fs)/2);
plot((0:length(fs)-1)*(1/length(sp)),fs);


figure(2)

plot((0:length(sp)-1)/fe,sp)
sound(sp,fe,16);

%*****************************************
% Example 8: Downsampling
s1=sp(1:2:length(sp));
fe=fe/2;
figure(1);
fs=abs(fft(s1));fs=fs(1:length(fs)/2);
plot((0:length(fs)-1)*(1/length(s1)),fs);



figure(2)
plot((0:length(s1)-1)/fe,s1)
sound(s1,fe,16);

%*****************************************
%Example 9: Upsampling
fe=11000;
t=0:8191*2;
s=cos(2*pi*t/32);
figure(1)

fs=abs(fft(s));fs=fs(1:length(fs)/2);
plot((0:length(fs)-1)*(1/length(s)),fs);

sound(s,fe,16);

s3=zeros(1,2*length(s));
s3(1:2:length(s3))=s;
fe2=fe*2;
figure(2)
fs=abs(fft(s3));fs=fs(1:length(fs)/2);
plot((0:length(fs)-1)*(1/length(s3)),fs);

sound(s3,fe2,16);

%*****************************************
% Example 10: lowpass filtering
sp=filter(h,1,s3);
figure(1)
fs=abs(fft(sp));fs=fs(1:length(fs)/2);
plot((0:length(fs)-1)*(1/length(sp)),fs);


figure(2)
plot((0:length(sp)-1)/fe2,sp)
sound(sp,fe2,16);

%*****************************************
%Example of reconstruction the highpass component
% Original signal
fe=22000;
t=0:8191;
s=[cos(2*pi*t/64) cos(2*pi*t/64) cos(2*pi*t/2.5) cos(2*pi*t/7)];

figure(1)
plot((0:length(s)-1)*(fe/length(s)),abs(fft(s)));

figure(2)
plot((0:length(s)-1)/fe,s);
sound(s,fe,16);

%Highpass filtering
sp=filter(g,1,s);

figure(1)
plot((0:length(sp)-1)*(fe/length(sp)),abs(fft(sp)));

figure(2)
plot((0:length(sp)-1)/fe,sp)
sound(sp,fe,16);

%Downsampling
s1=sp(1:2:length(sp));
fe=fe/2;
figure(1)
plot((0:length(s1)-1)*(fe/length(s1)),abs(fft(s1)));

figure(2)
plot((0:length(s1)-1)/fe,s1)
sound(s1,fe,16);

%Upsampling
s3=zeros(1,2*length(s1));
s3(1:2:length(s3))=s1;
fe=fe*2;
figure(2);

plot((0:length(s3)-1)*(fe/length(s3)),abs(fft(s3)));
sound(s3,fe,16);

%Highpass filtering
sp=filter(g,1,s3);
figure(1)
plot((0:length(sp)-1)*(fe/length(sp)),abs(fft(sp)));
figure(2)
plot((0:length(sp)-1)/fe,sp)
sound(sp,fe,16);


% example of filter bank

%%%%
clear h0 g0
h0=[0.48296     0.83652     0.22414    -0.12941];

%Definition of the analysis High pass filter
for n=0:length(h0)-1,
   g0(n+1)=h0(n+1)*(-1)^(n+1);
end;
g0=g0(length(g0):-1:1);


s=randn(1,16); % Test signal

sp=pconv(h0,s); %Periodic convolution
s1=sp(1:2:length(sp)); 

sp=pconv(g0,s);
d1=sp(1:2:length(sp));

s11=zeros(1,2*length(s1));
s11(1:2:length(s11))=s1;
s111=pconv(h0,fliplr(s11)); %fliplr is the reverse process

d11=zeros(1,2*length(d1));
d11(1:2:length(d11))=d1;
d111=pconv(g0,fliplr(d11));


rec=fliplr((d111+s111));

[rec' s'] %?



%*****************************************
%Example compression
img=double(imread('lena256.bmp'));

wc = fwt_or_2d(0,img,4,h);

ptr2d(wc,4);
colormap(gray(256));


%Selection of 10% large coefficient
coef=abs(wc(:));
coef=sort(coef);
threshold=coef(floor(length(coef)*0.9));
wc2=wc.*(abs(wc)>threshold);

%Quantification
wc2=floor(wc2);
ptr2d(wc2,4);


rec=fwt_or_2d(1,wc2,4,h);

affiche(rec);

%*****************************************
%Example denoising
img=double(imread('lena256.bmp'));

sb=img+randn(256,256)*10;

wc = fwt_or_2d(0,img,4,h);
%Estimation of the noise level
hf=[wc(129:256,1:128) wc(129:256,129:256) wc(1:128,129:256)];
sigma=median(abs(hf(:)))/0.6745

ptr2d(wc,4);
threshold=3*sigma;
% Soft thresholding
wc2=(sign(wc).*(abs(wc)-threshold)).*((abs(wc)>threshold));


rec=fwt_or_2d(1,wc2,4,h);

affiche(rec);


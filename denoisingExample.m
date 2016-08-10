%% IMAGE DENOISING EXAMPLE: 
%  Analyses the denoising performance of the wavelet transform

%  Code Developed by :
%  Kalliatakis Grigorios (January 2014) - gkalliatakis@yahoo.gr
%  Masters in Computer Vision
%  University of Burgundy, France
%  Advanced Image Analysis - Homework Project on Wavelet decomposition and Filter bank

%%
img=double(imread('lena256.bmp'));
h = [ 0.111540743350; 0.494623890398; 0.751133908021; 0.315250351709;-0.226264693965;-0.129766867567; 0.09750160558; 0.027522865530; -0.031582039317; 0.000553842201; 0.004777257511; -0.001077301085]';

noisyImg=img+randn(256,256)*10; % Add noise
figure(1);
affiche(noisyImg);title('Noisy Image','fontweight','bold','fontsize',14);
figure(12);
colormap(gray(256));
wc = fwt_or_2d(0,noisyImg,4,h);

%% Estimation of the noise level
hf=[wc(129:256,1:128) wc(129:256,129:256) wc(1:128,129:256)];
sigma=median(abs(hf(:)))/0.6745;
ptr2d(wc,4); title('Decomposed Noisy Image','fontweight','bold','fontsize',14);
threshold=3*sigma;

%% Soft thresholding
wc2=(sign(wc).*(abs(wc)-threshold)).*((abs(wc)>threshold));
rec=fwt_or_2d(1,wc2,4,h);
figure(2);
affiche(rec);title('Reconstructed Image with Soft Thresholding','fontweight','bold','fontsize',14);
s=randn(1,16); % Test signal

%%
h0=[0.48296     0.83652     0.22414    -0.12941];
%% Apply Forward Transform using the JlevelWaveletTransform function 
coff = JlevelWaveletTransform(img,4,h0);
figure(11);
colormap(gray(256));
affiche(coff);

%% Apply Inverse Transform using the JlevelInverseWaveletTransform function
rec = JlevelInverseWaveletTransform(coff,4,h0);
figure(21);
affiche(rec);title('Perfect Reconstructed Image ','fontweight','bold','fontsize',14);

%% Add noise using the already created sb from previous section
wc = JlevelWaveletTransform(noisyImg,4,h0);
figure(12);
colormap(gray(256));
ptr2d(wc,4);title('Decomposed Noisy Image','fontweight','bold','fontsize',14);

%% Estimation of the noise level
hf=[wc(129:256,1:128) wc(129:256,129:256) wc(1:128,129:256)];
sigma=median(abs(hf(:)))/0.6745;
threshold=3*sigma;

%% Hard thresholding
wc2=(wc).*((abs(wc)>threshold));

%% Apply Inverse Transform Code 
rec = JlevelInverseWaveletTransform(wc2,4,h0);
figure(22);
affiche(rec); title('Reconstructed Image with Hard Thresholding ','fontweight','bold','fontsize',14);


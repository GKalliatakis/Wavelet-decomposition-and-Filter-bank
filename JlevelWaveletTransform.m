function [ waveletCoefficients ] = JlevelWaveletTransform( inputImg,numberOfLevels,lowPassFilter)
%% FORWARD FILTER WAVELET TRANSFORM ON 2D IMAGES

% Illustrates how the J-level wavelet transform of an NxN image can be computed (assuming N is a power of 2) 

% parameters:
% inputImg    = input image
% numberOfLevels  = number of levels for the wavelet transform
% lowPassFilter  = Analysis low pass filter

% output: 
% waveletCoefficients = an array of NxN wavelet coefficients

% Code Developed by :
% Kalliatakis Grigorios (January 2014) - gkalliatakis@yahoo.gr
% Masters in Computer Vision
% University of Burgundy, France
% Advanced Image Analysis - Homework Project on Wavelet decomposition and Filter bank

%% Example of usage
%  %Read input image
%  inputImg=im2double(imread('barbara.jpg'));
%  %Number of levels for the wavelet transform
%  numberOfLevels=2;
%  %Analysis low-pass filter
%  lowPassFilter = [0.48296     0.83652     0.22414    -0.12941];  
%  waveletCoefficients = JlevelWaveletTransform(inputImg,numberOfLevels,lowPassFilter);
%  %Display the decomposed image  
%  figure,
%  imshow(waveletCoefficients);
%  title('Decomposed Image','fontweight','bold','fontsize',18);

%% Definition of the analysis High pass filter based on Low pass filter
for n=0:length(lowPassFilter)-1,
   g(n+1)=lowPassFilter(n+1)*(-1)^(n+1);
end;
g=g(length(g):-1:1);

%% Init Variables  
S = size(inputImg,1);
waveletCoefficients = zeros(S,S);
temp = zeros(S,S);

%% Forward Wavelet Transform 1D on each row of the input images
for i=1:S  
    % low pass filtering
    sph=pconv(lowPassFilter,inputImg(i,:));  %Periodic convolution
    sc1=sph(1:2:length(sph)); % downsampling

    % high pass filtering 
    spg=pconv(g,inputImg(i,:));  %Periodic convolution
    sd1=spg(1:2:length(spg));

    % row temporary output of level nlevel
    temp(i,:) = [sc1, sd1];
end;

%% Forward Wavelet Transform 1D on each column of the input images
  for jj=1:S  
    % low pass filtering
    sph=pconv(lowPassFilter,temp(:,jj)');
    sc1=sph(1:2:length(sph)); % downsampling

    % high pass filtering 
    spg=pconv(g,temp(:,jj)');
    sd1=spg(1:2:length(spg));

    % output of level nlevel
    waveletCoefficients(:,jj) = [sc1, sd1];
  end;

%% Recursive call to the wavelet transform for deeper levels
  if(numberOfLevels > 1)
    waveletCoefficients(1:S/2,1:S/2) = JlevelWaveletTransform(waveletCoefficients(1:S/2,1:S/2), numberOfLevels-1, lowPassFilter );
  end
end


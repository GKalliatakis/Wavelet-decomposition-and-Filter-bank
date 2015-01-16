function [ reconstructedImg ] = JlevelInverseWaveletTransform( inputCoefficients,numberOfLevels,lowPassFilter)
%% INVERSE FILTER WAVELET TRANSFORM ON 2D IMAGES

% Illustrates how the inverse J-level wavelet transform of an NxN image can be computed (assuming N is a power of 2) 
% Also the reconstructed image would be computed from the input coefficients

% parameters:
% inputImg    = input image
% numberOfLevels  = number of levels for the wavelet transform
% lowPassFilter  = Analysis low pass filter

% output:
% reconstructedImg = image reconstructed from the input coefficients

% Code Developed by :
% Gregory Kalliatakis (January 2014) - gkalliatakis@yahoo.gr
% Masters in Computer Vision
% University of Burgundy, France
% Advanced Image Analysis - Homework Project on Wavelet decomposition and Filter bank

%% Example of usage
%  %Read input image
%  inputImg=im2double(imread('barbara.jpg'));
%  %Number of levels for the wavelet transform
%  numberOfLevels=1;
%  %Analysis low-pass filter
%  lowPassFilter = [0.48296     0.83652     0.22414    -0.12941];  
%  inputCoefficients = JlevelWaveletTransform(inputImg,numberOfLevels,lowPassFilter);
%  reconstructedImg  = JlevelInverseWaveletTransform(inputCoefficients,numberOfLevels,lowPassFilter);
%  %Display the decomposed image  
%  figure(1);
%  imshow(inputCoefficients);
%  title('Decomposed Image','fontweight','bold','fontsize',18);
%  %Display the reconstructed image  
%  figure(2);
%  imshow(reconstructedImg);
%  title('Reconstructed Image');title('Reconstructed Image','fontweight','bold','fontsize',18);


%% Definition of the analysis High pass filter based on Low pass filter
for n=0:length(lowPassFilter)-1,
   g(n+1)=lowPassFilter(n+1)*(-1)^(n+1);
end;
g=g(length(g):-1:1);

%% Init Variables  
S = size(inputCoefficients,1);
reconstructedImg = zeros(S,S);
temp = zeros(S,S);


  %% Recursive call to the inverse wavelet transform for deeper levels
  if(numberOfLevels > 1)
    inputCoefficients(1:S/2,1:S/2) = JlevelInverseWaveletTransform(inputCoefficients(1:S/2,1:S/2), numberOfLevels-1, lowPassFilter );
  end;

  %% Inverse  Wavelet Transform 1D on each column of the input images
  for j=1:S
    % upsampling
    sc1 = inputCoefficients(1:S/2,j);
    sc11=zeros(1,2*length(sc1));
    sc11(1:2:length(sc11))=sc1;


    sd1 = inputCoefficients((S/2)+1:S,j);
    sd11=zeros(1,2*length(sd1));
    sd11(1:2:length(sd11))=sd1;

    % low pass filter
    sc2 = pconv(lowPassFilter,fliplr(sc11));

    % hig pass filter
    sd2 = pconv(g,fliplr(sd11));

    % column temporary reconstruction of level nlevel
    temp(:,j) = fliplr(sd2 + sc2);
  end;
  
%% Inverse  Wavelet Transform 1D on each row of the input images
  for i=1:S  
    % upsampling
    sc1 = temp(i,1:S/2);
    sc11=zeros(1,2*length(sc1));
    sc11(1:2:length(sc11))=sc1;

    sd1 = temp(i,(S/2)+1:S);
    sd11=zeros(1,2*length(sd1));
    sd11(1:2:length(sd11))=sd1;

    % low pass filter
    sc2 = pconv(lowPassFilter,fliplr(sc11));

    % hig pass filter
    sd2 = pconv(g,fliplr(sd11));

    % reconstruction of level nlevel
    reconstructedImg(i,:) = fliplr(sd2 + sc2);
  end
  

end


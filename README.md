# Wavelets, Filter Banks and Applications

### The wavelet transform and its applications in image denoising

![alt tag](https://raw.githubusercontent.com/GKalliatakis/Wavelet-decomposition-and-Filter-bank/master/Barbara.png)


### Overview
In this exercise, we investigate the wavelet transform and its applications in image denoising. For this reason two functions were developed:

1. j-level wavelet transform of an NxN image
2. inverse j-level wavelet transform of and NxN array of wavelet coefficients

### Implementation Details
Two functions and a script were developed. 
Two functions were developed: *JlevelWaveletTransform* and *JlevelInverseWaveletTransform*, and a script called *denoisingExample*.

**Forward Filter Wavelet Transform on 2d Image:**
Illustrates how the J-level wavelet transform of an NxN image can be computed (assuming N is a power of 2). The function to calculate wavelet coefficients takes 3 input arguments: an input image,
the number of levels J, and low pass filter. It outputs an array of NxN wavelet coefficients.

**Inverse Filter Wavelet Transform on 2d Images:**
Illustrates how the inverse J-level wavelet transform of an NxN image can be computed (assuming N is a power of 2). Also the reconstructed image would be computed from the input coefficients. It takes 3 inputs: array of wavelet coefficients, the number of levels J and low pass filter. It
outputs a reconstructed image.

### Example
In order to regenerate the results found inf folder _Results_, the script *denoisingExample* must be ran.

License
----
Wavelets, Filter Banks and Applications is released under the MIT License.




**This app is for learning purposes, and not meant for any use in production / commercial purposes.**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [@thomasfuchs]: <http://twitter.com/thomasfuchs>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [keymaster.js]: <https://github.com/madrobby/keymaster>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]:  <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>

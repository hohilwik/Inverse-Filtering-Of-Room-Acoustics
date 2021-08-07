# Inverse-Filtering-Of-Room-Acoustics
Implementing a paper in inverse filtering of room acoustics by Miyoshi, Kaneda, 1988
# Inverse Filtering of Room Acoustics
 Shantanu, 2020112002
 Atharva Gogate, 2020112001
 
 ## Abstract
 A novel method is proposed for realizing exact inverse filtering of acoustic impulse responses in a room. This method is based on the principle called the multiple-inputloutput inverse theorem (MINT). Because a room impulse response generally has nonminimum phases, it has been impossible to realize exact inverse filtering of room acoustics using previously reported methods.
 
 ## Existing Method
 
 There are several methods of finding the inverse of the impulse response of a room, however, many of them are based on the least-squares-error criterion and are not exact inverses, but only an approximation.
 
 d(k) = g(k)*h(k)
 
 where d(k)= 1 for k=1, 
 and d(k)=0 for other k
 
 D = GH 
 where GH is matrix representation of the convolution
 
 H = (G^T G)^-1 G^T D
 
 This is the method of finding the inverse filter with the least squares error method, which works for all phases of a room response, but is not exact and the error is sometimes unacceptable

 
 ## Proposed Method
 
 The proposed method is to  use multiple speaker-receiver channels in order to have enough equations to find the exact inverse.
 
 The multiple input/output theorem is used to find the exact inverse of a linear FIR system. According to this theorem, it is possible to find the exact inverse of a non-minimum-phase system. A minimum-phase system is one whose Laplace transform has no poles or zeroes in the right half-plane. When a function is minimum phase, the log magnitude and phase of the Fourier transform are related through the Hilbert transform. This relationship depends on the fact that the log of the Laplace transform is analytic in the right half-plane for minimum phase functions.

Let h(t) be an arbitrary room impulse, we would expect it to be stable and causal, but in general, nonminimum phase impulse response. The phase of the Fourier response can be expressed as the sum of a minimum phase component and a component which represents the deviation from minimum phase. 

With this, H(w) can be factored into a minimum phase and an allpass part
H(w)=M(w)A(w)
where 
M(w)=|H(w)|exp[i*phi_m(w)]
and
A(w)=exp[i*phi_m(w)]

and |A(w)|=1 for any minimum phase, since when H(w) is minimum phase, phi_m(w)=0, which implies that A(w)=1

Minimum phase impulse responses are important because their inverses are guaranteed to be minimum phase and causal. If a room impulse is minimum phase, then an inverse filter will exist capable of completely removing the room's effect on the speech signal.

According to Neely et al[1], it was found that some of the distortion in the signal caused by the room's impulse response is indeed nonminimum phase. The allpass component, A(w) of the impulse response is not possible to be filtered just by knowing the amplitude of thr impulse response, and we need measurements of its time delay in order to filter it out. This is solved by playing a known audio in the room, and recording the output, in order to calculate the impulse response.

 
 ## Simulation and Results
 
 We simulated the room impulse response using the method described in [6] and wrote code to account for many possible circumstances for the room.
 A room impulse response simulator was written, with support for multiple inputs and outputs, and the room inpulse response with reference to each input, and different reflectivities for each of the six walls. 
 
 
![Power Spectra of Room Response](https://github.com/hohilwik/Inverse-Filtering-Of-Room-Acoustics/blob/main/images/power_spectra_of_room_response.jpg "Power Spectra of Room Response")
 
 We found that the room impulse response we achieved closely resembled that given in the paper, with some frequencies being much more attenuated than others, likely due to the specifications of the room. A direct inverse filter H(z) = 1/G(z) of this was also implemented, which gives us badinversefilter.wav, which can be seen when the code is run. This inverse filter does bring back a lot of the original audio, but adds a lot of noise near the poles, leading to unpleasantness. 
 
 The better filter proposed in the paper was also implemented using a circulant matrix, results of which will be attached later.
 
 ## Conclusion
 
 ## References
 [1] ST Neely and JB Allen, "Invertibility of a room impulse response", 1979
 
 
[2] LA Poole, GE Warnaka, and RC Cutter, "The implementation of digital filters using a modified Widrow-Hoff algorithm for the adaptive cancellation of acoustic noise", 1984


[3] M Miyoshi and Y Kaneda, "Inverse control of room acoustics using multiple loudspeakers and/or microphones", 1986


[4] Lehmann & Johansson, "Prediction of energy decay in room impulse responses simulated with an image-source model", J. Acoust. Soc. Am., vol. 124(1), pp. 269-277, July 2008)


[5] J.B. Allen and D.A. Berkley, "Image method for efficiently simulating small-room acoustics," Journal Acoustic Society of America, 65(4), April 1979, p 943


[6] A Oppenheim and RW Schafer, Digital Signal Processing, 1975

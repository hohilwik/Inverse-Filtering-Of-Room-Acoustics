ISM_RIR_bank(ISM_setup,'ISM_RIRs.mat');
dualchannelaudio = audioread('sample_classical_music.wav');
SrcSignalVec = dualchannelaudio(:,1);
AuData = ISM_AudioData('ISM_RIRs.mat',SrcSignalVec);
audiowrite('sample_with_echo.wav', AuData, 44100);

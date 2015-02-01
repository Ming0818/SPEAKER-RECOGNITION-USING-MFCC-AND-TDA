fs = 10000;               % Sampling Frequency 
t = hamming(4000); % Hamming window to smooth the speech signal 
w = [t ; zeros(6000,1)]; 
f = (1:10000); 
mel(f) = 2595 * log(1 + f / 700); % Linear to Mel frequency scale conversion  
tri = triang(100); 
win1 = [tri ; zeros(9900,1)]; % Defining overlapping triangular windows for  
win2 = [zeros(50,1) ; tri ; zeros(9850,1)]; % frequency domain analysis 
win3 = [zeros(100,1) ; tri ; zeros(9800,1)]; 
win4 = [zeros(150,1) ; tri ; zeros(9750,1)]; 
win5 = [zeros(200,1) ; tri ; zeros(9700,1)]; 
win6 = [zeros(250,1) ; tri ; zeros(9650,1)]; 
win7 = [zeros(300,1) ; tri ; zeros(9600,1)]; 
win8 = [zeros(350,1) ; tri ; zeros(9550,1)]; 
win9 = [zeros(400,1) ; tri ; zeros(9500,1)]; 
win10 = [zeros(450,1) ; tri ; zeros(9450,1)]; 
win11 = [zeros(500,1) ; tri ; zeros(9400,1)]; 
win12 = [zeros(550,1) ; tri ; zeros(9350,1)]; 
win13 = [zeros(600,1) ; tri ; zeros(9300,1)]; 
win14 = [zeros(650,1) ; tri ; zeros(9250,1)]; 
win15 = [zeros(700,1) ; tri ; zeros(9200,1)]; 
win16 = [zeros(750,1) ; tri ; zeros(9150,1)]; 
win17 = [zeros(800,1) ; tri ; zeros(9100,1)]; 
win18 = [zeros(850,1) ; tri ; zeros(9050,1)]; 
win19 = [zeros(900,1) ; tri ; zeros(9000,1)]; 
win20 = [zeros(950,1) ; tri ; zeros(8950,1)]; 
x = wavrecord(1* fs, fs, 'double'); % Record and store the uttered speech 
plot(x); 
wavplay(x); 
i = 1; 
while abs(x(i)) < 0.05                      % Silence detection 
      i = i + 1; 
end 
x(1 : i) = []; 
x(6000 : 10000) = 0; 
x1 = x.* w; 
mx = fft(x1);                         % Transform to frequency domain 
nx = abs(mx(floor(mel(f)))); % Mel warping 
nx = nx./ max(nx); 
nx1 = nx.* win1; 
nx2 = nx.* win2; 
nx3 = nx.* win3; 
nx4 = nx.* win4;  
nx5 = nx.* win5; 
nx6 = nx.* win6; 
nx7 = nx.* win7; 
nx8 = nx.* win8; 
nx9 = nx.* win9; 
nx10 = nx.* win10; 
nx11 = nx.* win11; 
nx12 = nx.*win12; 
nx13 = nx.* win13; 
nx14 = nx.* win14; 
nx15 = nx.* win15; 
nx16 = nx.* win16; 
nx17 = nx.* win17; 
nx18 = nx.* win18; 
nx19 = nx.* win19; 
nx20 = nx.* win20; 
sx1 = sum(nx1.^ 2); % Determine the energy of the signal within each window 
sx2 = sum(nx2.^ 2); % by summing square of the magnitude of the spectrum 
sx3 = sum(nx3.^ 2); 
sx4 = sum(nx4.^ 2); 
sx5 = sum(nx5.^ 2); 
sx6 = sum(nx6.^ 2); 
sx7 = sum(nx7.^ 2); 
sx8 = sum(nx8.^ 2); 
sx9 = sum(nx9.^ 2); 
sx10 = sum(nx10.^ 2); 
sx11 = sum(nx11.^ 2); 
sx12 = sum(nx12.^ 2); 
sx13 = sum(nx13.^ 2); 
sx14 = sum(nx14.^ 2); 
sx15 = sum(nx15.^ 2); 
sx16 = sum(nx16.^ 2); 
sx17 = sum(nx17.^ 2); 
sx18 = sum(nx18.^ 2); 
sx19 = sum(nx19.^ 2); 
sx20 = sum(nx20.^ 2); 
sx = [sx1, sx2, sx3, sx4, sx5, sx6, sx7, sx8, sx9, sx10, sx11, sx12, sx13, sx14, sx15, sx16, sx17, sx18, sx19, sx20];    
        
sx = log(sx);  
dx = dct(sx);                 % Determine DCT of Log of the spectrum energies 
fid = fopen('notepad.dat', 'w'); 
fwrite(fid, dx, 'real*8'); % Store this feature vector as a .dat file 
fclose(fid);
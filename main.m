samplingrate = 8000;
samplesize = 1 / samplingrate;
starttime = 0;
problem = '2b-';

f            = [261, 293, 309, 348, 393, 419, 492, 522, 467, 413, 393, 353, 309, 293, 261];
amplitude    = [  2,   2.2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2,   2];
timeduration = [  1,   0.7,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1,   1];
decayfactor  = [2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5, 2.5];
r = 0;

for n = 1:size(f, 2)

    t = starttime:samplesize:timeduration(n);
    res = amplitude(n) * ( exp( - decayfactor(n) * t) .* sin(2 * pi * f(n) * t));
    r = [r res];
end

plot(r);
audiowrite( strcat(problem, num2str( f(n) ), 'hz.wav'), r, samplingrate);
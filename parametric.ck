/*
* Computer Music and Sound
* Will Richards
* Parametric Composition
*/

SndBuf china => dac;
SndBuf w1 => dac;
SndBuf guitar => dac;
SndBuf scratch => dac;
// Load in sound files
me.dir() + "audio/w1.aiff" => w1.read;
me.dir() + "audio/china.aiff" => china.read;
me.dir() + "audio/wavDir4/guitar1.wav" => guitar.read;
me.dir() + "audio/wavDir3/dj_scratch.wav" => scratch.read;




//Set head of sound buffers to end
china.samples() => china.pos;
w1.samples() => w1.pos;
guitar.samples() => guitar.pos;
scratch.samples() => scratch.pos;



//set gain of soundbuffers
.9 => china.gain;
.8 => w1.gain;
.7 => guitar.gain;

//int to hold our beat
0 => int i;

//Run program forever


fun void background() {
    
    while(true) {
         
     0 => china.pos;

    5.3::second => now;
    
    
    
}

}


fun void guitarPhrase() {
    
    while(true){
        
    0 => guitar.pos;
    5::second => now;

}
     
}

spork ~ background();
spork ~ guitarPhrase();


1::day => now;
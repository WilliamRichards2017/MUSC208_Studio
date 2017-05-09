/*
* Computer Music and Sound
* Will Richards
* Parametric Composition
*/

SndBuf wgf => Pan2 p=> dac;
SndBuf high => dac;
SndBuf high2 => dac;
SndBuf scratch => p => dac;
SndBuf hit2 => p => dac;
SndBuf gucci => p => dac;
SndBuf dusty => dac;
SndBuf belt => dac;
SndBuf yeah => p => dac;
SndBuf brooklyn => dac;

fun float randGain() {
    return Std.rand2f( 0.3, 0.9);
    }

fun void panLoop(){
    
    while( true )
    {
        // modulate the pan
        Math.sin( now / 1::second *2 * pi ) => p.pan;
        // advance time
        10::ms => now;
    }
    }
    
    
    // midi note of 60 corresponds to middle c
    //C	C#	D	D#	E	F	F#	G	G#	A	A#	B
    [0,1,2,3,4,5,6,7,8,9,10,11] @=> int baseoctave[];
    0 => int c;
    1 => int cs;
    2 => int d;
    3 => int ds;
    4 => int e;
    5 => int f;
    6 => int fs;
    7 => int g;
    8 => int gs;
    9 => int a;
    10 => int as;
    11 => int b;
    
    [a,f,a,g] @=> int notes[];
    
    
    fun int[] convertOctave(int midiNotes[], int octave) {
        
        for (0 => int i; i < midiNotes.cap();  i++) {
            midiNotes[i] + octave*12 => midiNotes[i];
        }
        
        return midiNotes;
    }
    
    fun void midiNotes(int notes[], int octave, int n) {
        SinOsc sin => dac;
        
        convertOctave(notes, octave) @=> notes;
        
        for (0 => int j; j < n; j++) {
            for (0 => int i; i < notes.cap();  i++) {
                .4 => sin.gain;        
                std.mtof(notes[i]) => sin.freq;
                
                125::ms => now;
                
                0.0 => sin.freq;
            }     
        }     
    }
    




// Load in sound files

me.dir() + "audio/wavDir3/dj_scratch.wav" => scratch.read;
me.dir() + "audio/wgf.aiff" => wgf.read;
me.dir() + "audio/wavDir4/2Hit.wav" => hit2.read;
me.dir() + "audio/high.wav" => high.read;
me.dir() + "audio/high2.aiff" => high2.read;
me.dir() + "audio/wavDir2/gucci.wav" => gucci.read;
me.dir() + "audio/wavDir1/big_dusty.wav" => dusty.read;
me.dir() + "audio/wavDir2/belt.wav" => belt.read;
me.dir() + "audio/wavDir3/jay_yeah.wav" => yeah.read;
me.dir() + "audio/wavDir3/jay_brooklyn.wav" => brooklyn.read;



//Set head of sound buffers to end

scratch.samples() => scratch.pos;
wgf.samples() => wgf.pos;
hit2.samples() => hit2.pos;
gucci.samples()=> gucci.pos;
high.samples() => high.pos;
high2.samples() => high2.pos;
belt.samples() => belt.pos;
yeah.samples() => yeah.pos;
brooklyn.samples() => brooklyn.pos;

0.3 => wgf.gain;
0.3 => hit2.gain;
0.3 => gucci.gain;
0.3 => scratch.gain;




//set gain of soundbuffers


//int to hold our beat

fun void main(int n) {
    for (0 => int i; i < n*16; i++) {
       i % 16 => int beat;     
       
       if (beat==0) {
           0 => wgf.pos; 
           0 => scratch.pos;
       }  
       if (beat == 4) {
          0 => scratch.pos;            
       }          
       if (beat == 8) {
           randGain() => hit2.gain;   
           0 => hit2.pos;
       }     
       if (beat == 12) {
           randGain() => hit2.gain;   
           0 => hit2.pos;
       }           
       125::ms => now;     
   }
   
}


    
    fun void v1(int n) {
        for (0 => int i; i < n*16; i++) {
            i % 16 => int beat;
            
            if (beat==0) {
                0 => wgf.pos; 
                0 => scratch.pos;
            }
              
              if (beat == 4) {
                  0 => scratch.pos;            
              }    
              
              if (beat == 8) {
               randGain() => hit2.gain;   
               0 => hit2.pos;          
           }
           
           if (beat == 10) {
               randGain() => belt.gain;  
               0 => belt.pos;
            }
            
            if (beat == 12) {  
                randGain() => hit2.gain;     
                0 => hit2.pos;
            }
            
            125::ms => now;     
        }
        
    }
    
    fun void v2(int n) {
        for (0 => int i; i < n*16; i++) {
            i % 16 => int beat;
            
            if (beat==0) {
                0 => wgf.pos; 
                0 => scratch.pos;
            }  
            if (beat == 4) {
                0 => scratch.pos;            
            }            
            if (beat == 8 || beat == 12) {
                0 => gucci.pos;   
                randGain() => belt.gain;    
                0 => belt.pos;               
            }
            if (beat==10) {
                //randGain() => belt.gain;   
                //0 => belt.pos;
            }
            if (beat == 12) {
                randGain() => hit2.gain;   
                0 => hit2.pos;
            }   
            125::ms => now;     
        }
    }
    
    fun void v3(int n) {
        for (0 => int i; i < n*16; i++) {
            i % 16 => int beat;
            
            if (beat==0) {
                0 => wgf.pos; 
                0 => high.pos; 
            }  
            
            if (beat == 4) {
                0 => scratch.pos;
                0 => high.pos; 
                
            }    
            
            if (beat == 8) {
                0 => hit2.pos;
                0 => high.pos; 
            }
            
            if (beat == 12) {
                0 => hit2.pos;
                0 => high.pos; 
                0 => high2.pos;
            }
            
            if (beat==14) {
            randGain() => belt.gain;    
            0 => belt.pos;
                
            }
            
            125::ms => now;     
            }
            
        }
        
        
        
fun void outro ()  {
    
    1.5 => float f;
    1.2 => float j;
    
    for (0 => int i; i < 8; i++) {
        f-0.1 => wgf.rate;
        j-0.05 => yeah.rate;
        f-0.1 => f;
        j-0.05 => j;
        0 => wgf.pos;
        0 => yeah.pos;
        1::second => now;
    }
    1::second => now;
    0 => brooklyn.pos;
    
}


3::second => now;
spork ~ midiNotes(notes, 2, 24);
spork ~ panLoop();
spork ~ main(1);
2::second => now;
spork ~ v1(1);
2::second => now;
spork ~ main(1);
2::second => now;
spork ~ v2(1);
2::second => now;

1.5 => wgf.rate; 
spork ~ main(1);
2::second => now;
spork ~ v1(1);
2::second => now;
spork ~ main(1);
2::second => now;
spork ~ v3(1);
2::second => now;

1 => wgf.rate; 
spork ~ v2(1);
2::second => now;
spork ~ v1(1);
2::second => now;
spork ~ main(1);
2::second => now;
spork ~ v1(1);
2::second => now;
spork ~ outro();
5::second => now;


1::day => now;
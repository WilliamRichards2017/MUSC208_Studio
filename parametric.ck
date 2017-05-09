/*
* Computer Music and Sound
* Will Richards
* Parametric Composition
*/

SndBuf wgf => dac;
SndBuf high => dac;
SndBuf high2 => dac;
SndBuf scratch => dac;
SndBuf hit2 => dac;
SndBuf gucci => dac;
SndBuf com => dac;
SndBuf dusty => dac;
SndBuf belt => dac;
SndBuf yeah => dac;
SndBuf brooklyn => dac;


// Load in sound files

me.dir() + "audio/wavDir3/dj_scratch.wav" => scratch.read;
me.dir() + "audio/wgf.aiff" => wgf.read;
me.dir() + "audio/wavDir4/2Hit.wav" => hit2.read;
me.dir() + "audio/high.wav" => high.read;
me.dir() + "audio/high2.wav" => high2.read;
me.dir() + "audio/wavDir2/gucci_speaks.wav" => gucci.read;
me.dir() + "audio/wavDir1/count_on_me_2.wav" => com.read;
me.dir() + "audio/wavDir1/big_dusty.wav" => dusty.read;
me.dir() + "audio/wavDir2/belt.wav" => belt.read;
me.dir() + "audio/wavDir3/jay_yeah.wav" => yeah.read;
me.dir() + "audio/wavDir3/jay_brooklyn.wav" => brooklyn.read;



//Set head of sound buffers to end

scratch.samples() => scratch.pos;
wgf.samples() => wgf.pos;
hit2.samples() => hit2.pos;
gucci.samples()=> gucci.pos;
com.samples() => com.pos;
high.samples() => high.pos;
belt.samples() => belt.pos;
yeah.samples() => yeah.pos;
brooklyn.samples() => brooklyn.pos;








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
           0 => hit2.pos;
           }
           
       if (beat == 12) {
         
         0 => hit2.pos;
           }
           
           if (beat==14) {
            0 => high.pos;                }   
           
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
               0 => com.pos;
               
            }
            
            if (beat == 10) {
                0 => belt.pos;
                }
            
            if (beat == 12) {
                
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
                0 => belt.pos;               
            }
            
            if (beat==10) {
               // 0 => belt.pos;
                }
            
            if (beat == 12) {
                
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
            }  
            if (beat == 4) {
                0 => scratch.pos;
                
            }    
            
            if (beat == 8) {
                0 => hit2.pos;
            }
            
            if (beat == 12) {
                0 => belt.pos;
                0 => hit2.pos;
            }
            
            if (beat==14) {
               0 => high.pos;
               
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
 

//Run program forever
3::second => now;


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

1 => wgf.rate; 
spork ~ main(1);
2::second => now;
spork ~ v1(1);
2::second => now;
spork ~ main(1);
2::second => now;
spork ~ v1(1);
2::second => now;
spork ~ outro();








1::day => now;
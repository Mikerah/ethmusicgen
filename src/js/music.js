// Randomize BPM for each song
var BPM = Math.Floor((Math.Random() * 80) + 120);

// Set global tempo
Tone.Transport.bpm.value = BPM;

// Synths

var polySynth = new Tone.PolySynth(4, Tone.Synth);
var duoSynth = new Tone.DuoSynth();
var monoSynth = new Tone.MonoSynth();

var array_of_synths = [polySynth, duoSynth, monoSynth];

// Drums

// Chords


// Generate Music
function generateMusic() {
    
    
}
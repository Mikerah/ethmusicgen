// Randomize BPM for each song
var BPM = Math.Floor((Math.Random() * 80) + 120);

// Set global tempo
Tone.Transport.bpm.value = BPM;

// Synths

var polySynth = new Tone.PolySynth(4, Tone.Synth);
var duoSynth = new Tone.DuoSynth();
var monoSynth = new Tone.MonoSynth();

var bass = new Tone.MonoSynth({
      "volume": -10,
      "envelope": {
        "attack": 0.1,
        "decay": 0.3,
        "release": 2,
      },
      "filterEnvelope" : {
        "attack" : 0.001,
        "decay": 0.01,
        "sustain": 0.5,
        "baseFrequency": 200,
        "octaves": 2.6
      }
});

var array_of_synths = [polySynth, duoSynth, monoSynth];

// Percussion
var kick = new Tone.MembraneSynth({
      "envelope" : {
        "sustain": 0,
        "attack": 0.02,
        "decay": 0.8
      },
      "octaves": 10
});

var snare = new Tone.NoiseSynth({
      "volume": -5,
      "envelope": {
        "attack": 0.001,
        "decay": 0.2,
        "sustain": 0
      },
      "filterEnvelope": {
        "attack": 0.001,
        "decay": 0.1,
        "sustain": 0
      }
});

// Chords


// Generate Music
function generateMusic() {
    var index_of_synth = Math.Floor((Math.Random() * 0) + 2);
    var rand_synth = array_of_synths[index_of_synth].toMaster();

}

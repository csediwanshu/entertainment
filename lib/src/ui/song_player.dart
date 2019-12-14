
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class SongExample extends StatelessWidget {
  final String url;
  SongExample({Key key, this.url}) : super(key: key);
	@override
	Widget build(BuildContext context) {
		return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Infy Songs'),
      ),
    body: Column(
			children: <Widget> [
				Flexible(
					flex: 9,
					child: Placeholder(),				
				),
				Flexible(
					flex: 2,
					child: AudioControls(url:url),
				),
			],		
		),
    ); 	
	}
}

class AudioControls extends StatelessWidget{
  final String url;
  AudioControls({this.url});
	@override
	Widget build(BuildContext context) {
		return Column(
			children: [
				PlaybackButtons(url:url),
			],
		);
	}

}

class PlaybackButtons extends StatelessWidget {
  final String url;
  PlaybackButtons({this.url});
	@override
	Widget build(BuildContext context) {
		return Row(
			children: [
				PlaybackButton(url :url),

			]
		);
	}
}


class PlaybackButton extends StatefulWidget {
 final String url;
  PlaybackButton({this.url});
	@override
	_PlaybackButtonState createState() => _PlaybackButtonState();
}

class _PlaybackButtonState extends State<PlaybackButton> {

	bool _isPlaying = false;
	FlutterSound _sound = FlutterSound();
	String _url ;
  double _playPosition;

	// Stream<PlayStatus> _playerSubcription ;

	@override
	void initState() {
		super.initState();
		_sound = FlutterSound();
		_playPosition = 0.0;
     _url = widget.url;
	}	
	
	void _stop() async {
		await _sound.stopPlayer();
		setState(() => _isPlaying = false);
	}

	void _play() async {
		await _sound.startPlayer(_url);
		 _sound.onPlayerStateChanged..listen((e) {
			if (e != null) {
				// print(e.currentPosition);
				setState(() => _playPosition = (e.currentPosition / e.duration));				
				}		
			});
			setState(() => _isPlaying = true);
	}

	// void _fastForward() {}
	// void _rewind() {}

	@override
	Widget build(BuildContext context) {
		return Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget> [ 
			Slider(value: _playPosition ,onChanged: null,),
			Row(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				IconButton(icon: Icon(Icons.fast_rewind), onPressed: null),
				IconButton(
					icon: _isPlaying ? Icon(Icons.stop) : Icon(Icons.play_arrow),
					onPressed: () {
						if (_isPlaying) {
							_stop();
						} else {
							_play();
						}
					},		
				),
				IconButton(icon: Icon(Icons.fast_forward), onPressed: null),				
				],		
			),
			],	
		);
	}

  
}

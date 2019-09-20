import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {

  const VideoPlayerPage(
    this.url,{
    Key key,
  }):super(key:key);

  final String url;

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
    ..initialize().then((_){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('预告片'),backgroundColor: Theme.of(context).accentColor,),
      backgroundColor: Theme.of(context).accentColor,
      body: Center(
        child: _controller.value.initialized
          ?AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
          :Container()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _controller.value.isPlaying
              ?_controller.pause()
              :_controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying
            ?Icons.pause
            :Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
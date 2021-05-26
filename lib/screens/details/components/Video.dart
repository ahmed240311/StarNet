/*
import 'package:flutter/material.dart';
import 'package:starnet/models/Product.dart';
import 'package:video_player/video_player.dart';

import '../../../constants.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  // VideoPlayerController _controller2070;
  VideoPlayerController _cntroller2050;
  VideoPlayerController _go;
  VideoPlayerController _ferary;



  void _actionState(int controller_number) {
    setState(() {
      // _controller=_cntroller;

      // if (controller_number == 0) {
      //   _controller2070.value.isPlaying
      //       ? _controller2070.pause()
      //       : _controller2070.play();
      // }
      if (controller_number == 1) {
        _cntroller2050.value.isPlaying
            ? _cntroller2050.pause()
            : _cntroller2050.play();
      } else if (controller_number == 2) {
        _go.value.isPlaying ? _go.pause() : _go.play();
      } else if (controller_number == 3) {
        _ferary.value.isPlaying ? _ferary.pause() : _ferary.play();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
   */
/* _controller2070 = VideoPlayerController.asset("assets/images/2070.mp4")
      ..initialize().then((_) {
        _controller2070.play();
        // _controller2070.setLooping(true);
        // setState(() {});
      });*//*

    _cntroller2050 = VideoPlayerController.asset("assets/images/2050.mp4")
      ..initialize().then((_) {
        _cntroller2050.play();
        // _cntroller2050.setLooping(true);
        // setState(() {});
      });
    _go = VideoPlayerController.asset("assets/images/goj.mp4")
      ..initialize().then((_) {
        _go.play();

        // _go.setLooping(true);
        // setState(() {});
      });
    _ferary = VideoPlayerController.asset("assets/images/fehrary.mp4")
      ..initialize().then((_) {
        _ferary.play();
        // _ferary.setLooping(true);
        // setState(() {});
      });
  }

  // search for list view builder
  */
/*
  * create video model
  * pass the video item to the builder
  * create dynamice video player list compatible wit
  *
  * *//*

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // return ListView.builder(
    //   itemCount: 4,
    //   itemBuilder: (BuildContext context, int index) {
    //     if (videos == null) {
    //       return Container(
    //         child: Center(
    //           child: Text("Loading"),
    //         ),
    //       );
    //     } else {
    //       return Card(
    //         child: Hero(
    //           tag: "${videos.id}",
    //           child: Image.asset(
    //             "${videos.image[index]}",
    //             fit: BoxFit.fill,
    //           ),
    //         ),
    //       );
    //     }
    //   },
    // );
    return ListView(
      children: [
        // Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(24),
        //     ),
        //   ),
        //   child: Stack(
        //     children: [
        //      FittedBox(
        //         fit: BoxFit.fill,
        //         child: SizedBox(
        //           width: size.width * 2,
        //           height: size.height * .8,
        //           child: VideoPlayer(_controller2070),
        //         ),
        //       ),
        //       Positioned(
        //         width: size.width * .8,
        //         height: size.height * .3,
        //         child: IconButton(
        //           icon: Icon(
        //             Icons.pause,
        //             color: Colors.black12.withOpacity(.001),
        //           ),
        //           onPressed: () {
        //             _actionState(0);
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 12.0),
        // ),
        Stack(children: [
          FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
              width: size.width * 2,
              height: size.height * .8,
              child: VideoPlayer(_cntroller2050),
            ),
          ),
          Positioned(
            width: size.width * .8,
            height: size.height * .3,
            child: IconButton(
              icon: Icon(
                Icons.pause,
                color: Colors.black12.withOpacity(.001),
              ),
              onPressed: () {
                _actionState(1);
              },
            ),
          )
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
        Stack(
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: SizedBox(
                width: size.width * 2,
                height: size.height * .8,
                child: VideoPlayer(_go),
              ),
            ),
            Positioned(
              width: size.width * .8,
              height: size.height * .3,
              child: IconButton(
                icon: Icon(
                  Icons.pause,
                  color: Colors.black12.withOpacity(.001),
                ),
                onPressed: () {
                  _actionState(2);
                },
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
        ),
        Stack(
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: SizedBox(
                width: size.width * 2,
                height: size.height * .8,
                child: VideoPlayer(_ferary),
              ),
            ),
            Positioned(
              width: size.width * .8,
              height: size.height * .3,
              child: IconButton(
                icon: Icon(
                  Icons.pause,
                  color: Colors.black12.withOpacity(.001),
                ),
                onPressed: () {
                  _actionState(3);
                },
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    // _controller2070.dispose();
    _cntroller2050.dispose();
    _go.dispose();
    _ferary.dispose();
  }
}

// Widget VideoItem(Vidio vidio, double width, double height,
//     VideoPlayerController controller) {
//   return Column(
//     children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12.0),
//       ),
//       Stack(
//         children: [
//           FittedBox(
//             fit: BoxFit.fill,
//             child: SizedBox(
//               width: width * 2,
//               height: height * .8,
//               child: VideoPlayer(controller),
//             ),
//           ),
//           Positioned(
//             width: width * .8,
//             height: height * .3,
//             child: IconButton(
//               icon: Icon(
//                 Icons.pause,
//                 color: Colors.black12.withOpacity(.001),
//               ),
//               onPressed: () {
//                 controller.value.isPlaying
//                     ? controller.pause()
//                     : controller.play();
//               },
//             ),
//           )
//         ],
//       ),
//     ],
//   );
// }
*/

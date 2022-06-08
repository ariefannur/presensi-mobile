import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;
  CameraScreen(this.camera);

  @override
  State<StatefulWidget> createState() => _CameraScreen();
}

class _CameraScreen extends State<CameraScreen> {
  late CameraController cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    setUp();
  }

  setUp() {
    cameraController = CameraController(widget.camera, ResolutionPreset.medium);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    _initializeControllerFuture = cameraController.initialize();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(cameraController);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cameraController.takePicture();
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

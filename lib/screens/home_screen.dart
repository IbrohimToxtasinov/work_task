import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  double _dragPosition = 0.4;

  void _updateSheetSize(double dragPosition) {
    setState(() {
      _dragPosition = dragPosition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
            },
          ),
          DraggableScrollableSheet(
            controller: _controller,
            initialChildSize: _dragPosition,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return GestureDetector(
                onVerticalDragUpdate: (details) {
                  double newPosition = _dragPosition -
                      details.primaryDelta! /
                          MediaQuery.of(context).size.height;
                  if (newPosition < 0.2) {
                    newPosition = 0.2;
                  }
                  if (newPosition > 0.8) {
                    newPosition = 0.8;
                  }
                  _updateSheetSize(newPosition);
                  _controller.jumpTo(newPosition);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text("Item $index"),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

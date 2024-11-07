import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:work_task/utils/colors.dart';

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
          Positioned(
            top: 70,
            left: 15,
            right: 15,
            child: InkWell(
              onTap: () {
                _updateSheetSize(0.4);
                _controller.jumpTo(0.4);
              },
              child: Container(
                height: 54,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
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
                        margin: const EdgeInsets.only(top: 8),
                        width: 48,
                        height: 4,
                        decoration: BoxDecoration(
                          color: MyColors.cFFC4C5C7,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 28, 15, 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "43 shops near you",
                              style: TextStyle(
                                color: MyColors.c000000,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: MyColors.cEAEAEA),
                              ),
                              child:
                                  SvgPicture.asset("assets/icons/filter.svg"),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Padding(
                            padding: EdgeInsets.only(
                              right: 15,
                              left: 15,
                              bottom: 15,
                            ),
                            child: Divider(
                              color: MyColors.cEAEAEA,
                              thickness: 1,
                            ),
                          ),
                          padding: EdgeInsets.zero,
                          controller: scrollController,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const ListItem();
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

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "http://storage.kun.uz/source/old/Marufniki/ajfo1.jpg",
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Salon LadyDi",
                    style: TextStyle(
                      color: MyColors.c000000,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "2055 Los Angeles, CA, USA",
                    style: TextStyle(
                      color: MyColors.cA0A09C,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: MyColors.cFFFFFF,
                    width: 2,
                  ),
                ),
                child: const FlutterLogo(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 6,
            children: List.generate(
              3,
              (index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: MyColors.cA0A09C,
                    ),
                  ),
                  child: const Text(
                    "Hair Salon",
                    style: TextStyle(
                      fontSize: 12,
                      color: MyColors.cA0A09C,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              SvgPicture.asset("assets/icons/location_picker.svg"),
              const SizedBox(width: 4),
              Text(
                "650 m. from you",
                style: TextStyle(
                  fontSize: 12,
                  color: MyColors.c000000.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Excellent • ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: MyColors.c000000,
                  ),
                ),
                TextSpan(
                  text: "2.588 reviews",
                  style: TextStyle(color: MyColors.c000000),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

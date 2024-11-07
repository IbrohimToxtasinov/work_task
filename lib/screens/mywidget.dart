import 'package:flutter/material.dart';

class RestaurantCategories extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(

      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      height: 100,
      width: 300,
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}

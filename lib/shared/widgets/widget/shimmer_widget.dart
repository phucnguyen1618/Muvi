import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatefulWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  bool _isEnabled = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 5000)).then((value) {
      setState(() {
        _isEnabled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: _isEnabled,
      baseColor: Colors.redAccent,
      highlightColor: Colors.yellowAccent,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: 500,
        width: double.infinity,
      ),
    );
  }
}

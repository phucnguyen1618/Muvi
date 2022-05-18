import 'package:flutter/material.dart';

class ItemMovieSimilar extends StatelessWidget {
  const ItemMovieSimilar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 12.0,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          width: 160.0,
          height: 220.0,
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        const SizedBox(
          width: 160.0,
          height: 220.0,
          child: Text(
            'Demo slayer: Kimetsu no yaiba (Ky vien tran)',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

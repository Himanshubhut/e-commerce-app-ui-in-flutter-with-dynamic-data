import 'package:flutter/material.dart';

class AvaliableSize extends StatefulWidget {
  final String size;
  const AvaliableSize({super.key, required this.size});

  @override
  State<AvaliableSize> createState() => _AvaliableSizeState();
}

class _AvaliableSizeState extends State<AvaliableSize> {
  bool isselected = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() {
            isselected = !isselected;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(right: 16),
          width: 40,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isselected ? Colors.redAccent : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.red)),
          child: Text(
            widget.size,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
}

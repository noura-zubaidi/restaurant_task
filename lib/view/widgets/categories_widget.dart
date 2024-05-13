import 'package:flutter/material.dart';
class Categories extends StatelessWidget {
  final String imagePath;
  final String categoryName;


  const Categories({Key? key, required this.imagePath, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 120,
      width: 120,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child:  Image.network(
              //'https://i.pinimg.com/originals/d5/1c/26/d51c265f23624be0343f0bed659a69df.png',
              imagePath,

              height: 40,
              width: 40,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(6),
              child: Center(
                child: Text(
                  categoryName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
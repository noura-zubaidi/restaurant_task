import 'package:flutter/material.dart';
import 'package:resturant_task/model/categories.dart';

class CategoriesCard extends StatefulWidget {
  final String imagePath;
  final String? categoryName;
  final Categories categories;

  const CategoriesCard(
      {Key? key,
      required this.imagePath,
      required this.categories,
      this.categoryName})
      : super(key: key);

  @override
  State<CategoriesCard> createState() => _CategoriesCardState();
}

class _CategoriesCardState extends State<CategoriesCard> {
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
            child: Image.network(
              widget.imagePath,
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
                  widget.categories.name ?? '',
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

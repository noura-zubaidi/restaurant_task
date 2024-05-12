import 'package:flutter/material.dart';


class BurgerCategory extends StatefulWidget {
  BurgerCategory({super.key});

  @override
  State<BurgerCategory> createState() => _BurgerCategoryState();
}

class _BurgerCategoryState extends State<BurgerCategory> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
  final List<String> imageUrls = [
    'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/KUFWIPXROII6ZLAWR67XDFGNPA.jpg&w=1100',
    'https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/16:9/w_3743,h_2105,c_limit/Smashburger-recipe-120219.jpg',
    'https://assets-jpcust.jwpsrv.com/thumbnails/qSXwlEH3-720.jpg',
  ];
  final List<String> categories = ['Burger', 'Ice Cream', 'Pizza','Drink',
    'Sandwich','Taco','Donut','Pudding'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text(
              'Burger',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),

            TextField(
              onTap: (){
                setState(() {
                  _focusNode.requestFocus();
                });
              },
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                filled: true,
                suffixIcon: _controller.text.isNotEmpty? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                ) : null,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                ),
                fillColor: Colors.grey.shade100,
                prefixIcon: Icons.search != null ? Icon(Icons.search) : null,
                prefixIconColor: Colors.grey.shade500,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return Offers(
                        imagePath: 'Item $index',  categoryName: categories[index],
                      );
                    },
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class Offers extends StatefulWidget {
  final String imagePath;
  final String categoryName;

  const Offers({Key? key, required this.imagePath, required this.categoryName})
      : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 220,
      width: 160,
      child: Stack(
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
                    fit: BoxFit.cover,
                    width: 150,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.categoryName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          Image.network('https://cdn.iconscout.com/icon/free/png-256/free-star-bookmark-favorite-shape-rank-16-28621.png?f=webp',
                            width: 15,height: 15,),
                          SizedBox(width: 4,),
                          Text('4.5',style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500
                          ),)
                        ],
                      ),
                      SizedBox(height: 3,),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '22.00 \$  ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.grey.shade400,
                                  decorationThickness: 2
                              ),
                            ),
                            TextSpan(
                              text: '   20.00 \$',
                              style: TextStyle(
                                color: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                      )

                    ],

                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 1,
            right: 1,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                icon: Icon(
                  isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: isFavorited ? Colors.deepOrange : null,
                ),
                onPressed: () {
                  setState(() {
                    isFavorited = !isFavorited;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
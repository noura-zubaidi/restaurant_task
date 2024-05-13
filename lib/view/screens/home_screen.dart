import 'package:flutter/material.dart';
import 'package:resturant_task/view/screens/special_offers.dart';

import '../widgets/ads.dart';
import '../widgets/categories_widget.dart';
import '../widgets/customized_bottom_navigation.dart';
import '../widgets/customized_textfield.dart';
import 'constants.dart';
import 'location_map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _selectedLocation = 'First Location';
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LocationMapScreen()),
                          );
                        },
                        child: Text(
                          'Deliver to',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: DropdownButtonFormField(
                          value: _selectedLocation,
                          onChanged: (value) {
                            setState(() {
                              _selectedLocation = value!;
                            });
                          },
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.orange),
                          decoration:
                              const InputDecoration.collapsed(hintText: ''),
                          items: ['First Location', 'Second Location']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 140,
                    ),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocationMapScreen()),
                          );
                        },
                        child: Icon(Icons.shopping_bag_rounded)),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 180,
                  width: 350,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Ads(
                        imageUrl: imageUrls[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    3,
                    (index) => Hero(
                      tag: 'indicator_$index',
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 8,
                        width: _currentIndex == index ? 20 : 8,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? Colors.deepOrange
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                hintText: 'Search',
                prefixIcon: Icons.search,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: 12,
                        itemBuilder: (BuildContext context, int index) {
                          return Categories(
                            imagePath: categoryImage[index],
                            categoryName: categories[index],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Special Offers',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          // SizedBox(width: 50,),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SpecialOffers()),
                                );
                              },
                              child: const Text('View All >',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.deepOrange))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Offers(
                              imagePath:
                                  'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
                              categoryName: 'Burger'),
                          Offers(
                              imagePath:
                                  'https://www.shutterstock.com/image-photo/burger-tomateoes-lettuce-pickles-on-600nw-2309539129.jpg',
                              categoryName: 'Burger'),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),


        bottomNavigationBar: CustomBottomNavigationBar()
    );
  }
}

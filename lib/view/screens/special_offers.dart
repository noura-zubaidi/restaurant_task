import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_task/model/special_offers.dart';
import 'package:resturant_task/view/screens/constants.dart';

import 'package:resturant_task/view_model/special_offers_provider.dart';

class SpecialOffers extends StatefulWidget {
  const SpecialOffers({super.key});

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

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
            const SizedBox(height: 70),
            const Text(
              'Special Offers',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              onTap: () {
                setState(() {
                  _focusNode.requestFocus();
                });
              },
              controller: _controller,
              focusNode: _focusNode,
              decoration: InputDecoration(
                filled: true,
                suffixIcon: _controller.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                        },
                      )
                    : null,
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                fillColor: Colors.grey.shade100,
                // ignore: unnecessary_null_comparison
                prefixIcon:
                    Icons.search != null ? const Icon(Icons.search) : null,
                prefixIconColor: Colors.grey.shade500,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Consumer<SpecialOffersProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final specialOffers = provider.specialOffers?.specialOffers;

                  if (specialOffers == null || specialOffers.isEmpty) {
                    return const Center(child: Text('No offers available'));
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: specialOffers.length,
                    itemBuilder: (BuildContext context, int index) {
                      final offer = specialOffers[index];
                      return OfferCard(
                        offer: offer,
                        imagePath: offerImage[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OfferCard extends StatefulWidget {
  final String imagePath;
  final Offer offer;

  const OfferCard({Key? key, required this.offer, required this.imagePath})
      : super(key: key);

  @override
  _OfferCardState createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
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
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imagePath,

                    //widget.offer.image ?? '',
                    fit: BoxFit.cover,
                    width: 150,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.offer.name ?? '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(Icons.star, size: 15, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            widget.offer.rating?.toString() ?? '',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${widget.offer.originalPrice} ${widget.offer.currency} ',
                              style: const TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '${widget.offer.discountPrice} ${widget.offer.currency}',
                              style: const TextStyle(color: Colors.deepOrange),
                            ),
                          ],
                        ),
                      ),
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
              decoration: const BoxDecoration(
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

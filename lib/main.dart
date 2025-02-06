import 'dart:convert'; // For JSON decoding

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<Map<String, dynamic>>> loadJsonData() async {
  String jsonString = await rootBundle.loadString('assets/offers.json');
  List<dynamic> jsonList = jsonDecode(jsonString);
  return jsonList.cast<Map<String, dynamic>>();
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFEFEFF4),
        appBar: AppBar(
          toolbarHeight: 135.0,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discounts & Offers',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '233 items',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black, size: 38.0),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info_outline, color: Colors.black, size: 34.0),
            ),
          ],
        ),
        body: SingleChildScrollView(
  child: Column(
    children: [
      SavingsCornerSection(),
      SizedBox(height: 5),
      RewardsInviteSection(),
      SizedBox(height: 5),
      OfferZoneDivider(),
      SizedBox(height: 5),
      FutureBuilder<List<Map<String, dynamic>>>(
        future: loadJsonData(), // Load JSON data
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Display "uh-oh" and "No offers available at the moment"
            return Padding(
  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 18.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Display image above the text "uh-oh"
      Center(
        child: Icon(
          Icons.search,
          color: Colors.grey,
          size: 100, // Adjust icon size as needed
        ),
      ),
    // Space between image and text
      Text(
        '"uh-oh"',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey, // Highlight "uh-oh" text with red color
        ),
      ),
      SizedBox(height: 10), // Add space between the texts
      Text(
        'No offers available at the moment',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ],
  ),
);

          } else {
            // Display all offers
            return Column(
              children: snapshot.data!.map((offer) {
                return OfferCard(offer: offer);
              }).toList(),
            );
          }
        },
      ),
    ],
  ),
),
        bottomNavigationBar: const BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'NAVBAR (TBD)',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        
        ),
        
      ),

    );
  }
}

class SavingsCornerSection extends StatelessWidget {
  const SavingsCornerSection();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Savings Corner Clicked!");
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
        child: Stack(
          children: [
            // Main container
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                      "SAVINGS CORNER",
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset(
                          'assets/coupon with gift box.png',
                          height: 70.0,
                          width: 100.0,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(padding: EdgeInsets.only(bottom: 35.0),
                          child: RichText(
                            text: TextSpan(
                              text: "Do you have a ",
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: "Coupon ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: [Colors.pink, Colors.purple],
                                      ).createShader(
                                          Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                                  ),
                                ),
                                const TextSpan(
                                  text: "?",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Second container (ENTER COUPON CODE button)
            Positioned(
  bottom: 0,
  right: 0,
  child: GestureDetector(
    onTap: () {
      print("Enter Coupon Code Clicked!");
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.pink],
          begin: Alignment(1.0, -0.035),
          end: Alignment(-1.0, 1.035),
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(5),
        ),
      ),
      child: const Text.rich(
        TextSpan(
          text: 'Enter ', // Normal weight
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'Coupon ', // Bold weight
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Code', // Normal weight
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
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

class RewardsInviteSection extends StatelessWidget {
  const RewardsInviteSection();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Rewards Invite Section Clicked!");
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 1.0, left: 18.0, right: 18.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.pink, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left section with slogans
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text.rich(
                        TextSpan(
                          text: 'Get rewards by ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'inviting ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'your friends to ',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: 'order',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'from DropSi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const Text(
      'Share link in a group',
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.normal,
        fontFamily: 'Poppins',
        color: Colors.white70,
      ),
    ),
    const SizedBox(width: 4), // Space between text and icon
    Image.asset(
      'assets/Share Rounded.png', // Replace with the correct path to your share icon
      height: 16.0, // Adjust size as needed
      width: 16.0,
    ),
  ],
),

                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Right section with image
                Image.asset(
                  'assets/money and phone.png', // Replace with the correct image asset path
                  height: 116.0,
                  width: 146.0,
                  fit: BoxFit.scaleDown,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OfferZoneDivider extends StatelessWidget {
  const OfferZoneDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0), // Add space around the divider
      child: Row(
        children: [
          // Left divider
          const Expanded(
            child: Divider(
              color: Colors.grey, // Color of the line
              thickness: 1, // Thickness of the line
              indent: 18.0, // Indent from the start
              endIndent: 8.0, // Space between line and text
            ),
          ),
          // Center text
          Text(
            'OFFER ZONE',
            style: const TextStyle(
              fontSize: 14.0, // Font size
              fontWeight: FontWeight.bold, // Bold font
              fontFamily: 'Poppins', // Font family
              color: Colors.grey, // Text color
            ),
          ),
          // Right divider
          const Expanded(
            child: Divider(
              color: Colors.grey, // Color of the line
              thickness: 1, // Thickness of the line
              indent: 8.0, // Space between text and line
              endIndent: 18.0, // Indent at the end
            ),
          ),
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final Map<String, dynamic> offer;

  const OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row with Offer Text
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Flat ",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        WidgetSpan(
                          child: ShaderMask(
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                colors: [
                                  Colors.orange,
                                  Colors.white,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds);
                            },
                            child: Text(
                              offer['discountPercentage'] ?? "N/A",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: " Offer",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Offer Description Row with Image
            Row(
              children: [
                // Offer Description Text
                Expanded(
                  flex: 3,
                  child: Text(
                    offer['description'] ?? "No description available",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                // Offer Image
                Flexible(
                  flex: 1,
                  child: Transform.translate(
                    offset: Offset(0, -60),
                    child: Image.asset(
                      "assets/discount label.png",
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            // Product Info
            Row(
              children: [
                // Product Image
                Image.asset(
                  offer['productImage'] ?? "assets/placeholder.png",
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 16),
                // Product Details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer['productname'] ?? "No product name",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          offer['currentPrice'] ?? "N/A",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          offer['originalPrice'] ?? "N/A",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text.rich(
                      TextSpan(
                        text: 'Max quantity: ',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: '1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // Additional Info Container
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      offer['additionalInfo'] ?? "No additional info",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  TextButton(
                    onPressed: () {
                      // Add navigation logic for "Know more"
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50, 20),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'Know more',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
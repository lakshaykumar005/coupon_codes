import 'package:flutter/material.dart';

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
            children: const [
              SavingsCornerSection(),
              SizedBox(height: 5), // Add spacing between sections
              RewardsInviteSection(),
              SizedBox(height: 5),
              OfferZoneDivider(),
              SizedBox(height: 5),
              OfferCard(),
              SizedBox(height: 5),
              OfferCard(),
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
  const OfferCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Add 18.0 padding around the entire card
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
      "92%",
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Text color overridden by ShaderMask
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
            SizedBox(height: 8), // Reduced vertical distance
            // Offer Description Row with Image
            Row(
              children: [
                // Offer Description Text
                Expanded(
                  flex: 3, // Occupies 75% of the row
                  child: Text(
                    'Get Svaad Sugar 1kg at best price when spend 49 on Grocery, Staples, Snacks & Packaged Food Products. Hurry Limited Period Offer.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(width: 8), // Small gap between text and image
                // Offer Image adjusted slightly above
                Flexible(
                  flex: 1, // Occupies 25% of the row
                  child: Transform.translate(
                    offset: Offset(0, -60), // Adjust image position (upward by 10 pixels)
                    child: Image.asset(
                      'assets/discount label.png',
                      height: 70, // Image size remains unchanged
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
                  'assets/svaadsugar.jpg',
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
                      'Svaad Sugar-1KG Pouch',
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
                          '₹5',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '₹65',
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
    text: 'Max quantity: ', // Normal weight
    style: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    ),
    children: [
      TextSpan(
        text: '1', // Bold weight
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
                      'Order for 49.00 more for tomorrow from Grocery & Staples, Snacks Packaged Foods excluding Baby Food to avail this offer!',
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

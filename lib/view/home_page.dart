import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // CATEGORY DATA
  final List<Map<String, String>> categories = [
    {"title": "Foods", "image": "🍲"},
    {"title": "Drinks", "image": "🥤"},
    {"title": "Snacks", "image": "🍔"},
    {"title": "Dessert", "image": "🍰"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF9A6C), Color(0xFFFFC371)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    "Welcome to M3\nRestaurant",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// SEARCH BAR
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search...",
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.shopping_cart),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// CATEGORY
            sectionTitle("Category"),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.orange.shade100,
                          child: Text(
                            categories[index]["image"]!,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          categories[index]["title"]!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// POPULAR
            sectionHeader("Popular"),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  popularCard("Cambodian Fish\nAmok Recipe"),
                  popularCard("Prahok with pork\nbelly"),
                ],
              ),
            ),

            /// ALL MENU
            sectionHeader("All Menu"),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.75,
              children: [
                menuCard("Beef Lok Lak", "12000 KHR"),
                menuCard("Samlor Korko", "12000 KHR"),
                menuCard("Fried Rice", "10000 KHR"),
                menuCard("Grilled Chicken", "15000 KHR"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ===== WIDGETS =====

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Title",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("See all", style: TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }

  Widget popularCard(String title) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget menuCard(String name, String price) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(price, style: const TextStyle(color: Colors.grey)),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.orange),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

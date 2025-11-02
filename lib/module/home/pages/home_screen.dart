import 'package:flutter/material.dart';
import 'package:news/module/home/widget/card_details.dart';
import '../widget/card_list.dart';
import '../widget/drawer_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [
          Icon(Icons.search, size: 35),
        ],
      ),
      drawer: const DrawerSheet(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Good Morning \n Here is Some News For You",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: CardList.iteam.length,
                itemBuilder: (context, index) {
                  return CardDetails(
                    card: CardList.iteam[index],
                    index: index,
                    isReversed: index % 2 == 1,
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

import 'package:MedicShare/assets/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:MedicShare/assets/features/home/widgets/address_box.dart';

import 'package:MedicShare/assets/features/home/widgets/carousel_image.dart';
import 'package:MedicShare/assets/features/home/widgets/deal_of_day.dart';
import 'package:MedicShare/assets/features/home/widgets/top_categories.dart';
import 'package:MedicShare/assets/features/search/screens/search_screen.dart';

import '../../../search/image_search.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void navigateToImageSearch() {
    Navigator.pushNamed(context, ImageSearch.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  child: Image.asset('assets/images/white_logo.png'),
                  // height: 50.0,
                  width: 170.00,
                ),
              ),
              InkWell(
                onTap: () {
                  navigateToImageSearch();
                },
                child: Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Icon(Icons.image_search_outlined,
                      color: Colors.white, size: 25),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AddressBox(),
            SizedBox(height: 10),
            Center(child: TopCategories()),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

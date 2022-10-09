import 'dart:developer';

import 'package:MedicShare/assets/common/widgets/loader.dart';
import 'package:MedicShare/assets/global_variables.dart';
import 'package:MedicShare/assets/features/home/widgets/address_box.dart';
import 'package:MedicShare/assets/product_details/screens/product_details_screen.dart';
import 'package:MedicShare/assets/features/search/services/search_services.dart';
import 'package:MedicShare/assets/features/search/widget/searched_product.dart';
import 'package:MedicShare/assets/models/product.dart';
import 'package:flutter/material.dart';
import 'package:MedicShare/assets/search/image_search.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  final bool imageSearch;
  const SearchScreen(
      {Key? key, required this.searchQuery, required this.imageSearch})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
    log(widget.imageSearch.toString());
  }

  fetchSearchedProduct() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  void navigateToImageSearch() {
    Navigator.pushNamed(context, ImageSearch.routeName);
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.imageSearch
          ? null
          : PreferredSize(
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
                      child: SizedBox(
                        child: Image.asset('assets/images/white_logo.png'),
                        height: 50.0,
                        width: 200.00,
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
      body: products == null
          ? const Loader()
          : Column(
              children: [
                widget.imageSearch
                    ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "Image Search Results",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    : const AddressBox(),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetailScreen.routeName,
                            arguments: products![index],
                          );
                        },
                        child: SearchedProduct(
                          product: products![index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

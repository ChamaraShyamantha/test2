import 'package:medic/assets/common/widgets/customButton.dart';
import 'package:medic/assets/global_variables.dart';
import 'package:medic/assets/features/address/screens/address_screen.dart';
import 'package:medic/assets/features/cart/widgets/cart_product.dart';
import 'package:medic/assets/features/cart/widgets/cart_subtotal.dart';
import 'package:medic/assets/features/home/widgets/address_box.dart';
import 'package:medic/assets/features/search/screens/search_screen.dart';
import 'package:medic/assets/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:medic/assets/search/image_search.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void navigateToAddress(int sum) {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
      arguments: sum.toString(),
    );
  }

  void navigateToImageSearch() {
    Navigator.pushNamed(context, ImageSearch.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        ?.map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();

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
                child: SizedBox(
                  child: Image.asset('assets/images/white_logo.png'),
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
          children: [
            const AddressBox(),
            const CartSubtotal(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: 'Proceed to Purchase (${user.cart!.length} items)',
                onTap: () => navigateToAddress(sum),
                color: Colors.teal[600],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.black12.withOpacity(0.08),
              height: 1,
            ),
            const SizedBox(height: 2),
            ListView.builder(
              itemCount: user.cart!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CartProduct(
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

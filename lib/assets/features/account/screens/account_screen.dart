import 'package:MedicShare/assets/features/account/services/account_services.dart';
import 'package:MedicShare/assets/global_variables.dart';
import 'package:MedicShare/assets/features/account/widgets/below_app_bar.dart';
import 'package:MedicShare/assets/features/account/widgets/orders.dart';
import 'package:MedicShare/assets/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';
import 'package:MedicShare/assets/search/image_search.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToImageSearch() {
      Navigator.pushNamed(context, ImageSearch.routeName);
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
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
              PopupMenuButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  icon: Image.asset(
                    'assets/images/user.png',
                    scale: 0.1,
                  ),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(
                            'Orders',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        PopupMenuItem(
                          child: Text('Become a Seller',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500)),
                        ),
                        PopupMenuItem(
                          child: Text('Wish List',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500)),
                        ),
                        PopupMenuItem(
                          child: Text('Log Out',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500)),
                          onTap: () => AccountServices().logOut(context),
                        ),
                      ]),
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(height: 20),
          SizedBox(height: 10),
          Orders(),
        ],
      ),
    );
  }
}

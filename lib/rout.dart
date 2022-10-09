import 'package:flutter/material.dart';
import 'package:medic/assets/common/widgets/bottom_bar.dart';
import 'package:medic/assets/features/authentication/screens/login.dart';
import 'package:medic/assets/features/authentication/screens/vender_auth.dart';
import 'package:medic/assets/features/authentication/screens/customer_auth.dart';
import 'package:medic/assets/features/home/screens/home_screen.dart';
//import 'package:medic/assets/admin/screens/admin_screen.dart';

import 'package:medic/assets/models/order.dart';
import 'package:medic/assets/models/product.dart';

//import 'package:medic/assets/common/widgets/bottom_bar.dart';
import 'package:medic/assets/features/address/screens/address_screen.dart';
import 'package:medic/assets/admin/screens/add_product_screen.dart';

import 'package:medic/assets/features/home/screens/category_deals_screen.dart';

import 'package:medic/assets/features/order_details/screens/order_details.dart';
import 'package:medic/assets/product_details/screens/product_details_screen.dart';
import 'package:medic/assets/features/search/screens/search_screen.dart';
import 'package:medic/assets/search/image_search.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case CustomerAuthenticationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CustomerAuthenticationScreen(),
      );
    case VenderAuthenticationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const VenderAuthenticationScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );

    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
          imageSearch: false,
        ),
      );
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(
          totalAmount: totalAmount,
        ),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );

    case ImageSearch.routeName:
      return MaterialPageRoute( settings:routeSettings, builder:(_) => ImageSearch());
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Error 404 Page not found'),
          ),
        ),
      );
  }
}

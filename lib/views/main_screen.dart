import 'package:app_web/views/side_bar_screens/buyers_screen.dart';
import 'package:app_web/views/side_bar_screens/category_screen.dart';
import 'package:app_web/views/side_bar_screens/orders_screen.dart';
import 'package:app_web/views/side_bar_screens/products_screen.dart';
import 'package:app_web/views/side_bar_screens/upload_banner_screen.dart';
import 'package:app_web/views/side_bar_screens/vendors_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = const CategoryScreen();
  screenSelector(item) {
    switch (item.route) {
      case BuyersScreen.id:
        setState(() {
          _selectedScreen = const BuyersScreen();
        });
        break;

      case VendorsScreen.id:
        setState(() {
          _selectedScreen = const VendorsScreen();
        });
        break;
      case OrdersScreen.id:
        setState(() {
          _selectedScreen = const OrdersScreen();
        });
        break;
      case CategoryScreen.id:
        setState(() {
          _selectedScreen = const CategoryScreen();
        });
        break;
      case ProductsScreen.id:
        setState(() {
          _selectedScreen = const ProductsScreen();
        });
        break;
      case UploadBannerScreen.id:
        setState(() {
          _selectedScreen = const UploadBannerScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AdminScaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFFFFFF),
          title: const Text("مدیریت"),
        ),
        body: Container(
          color: Color(0xffF5F7FF),
          child: _selectedScreen,
        ),
        sideBar: SideBar(
          activeBackgroundColor: const Color(0xff4B49Ac),
          activeTextStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          textStyle: const TextStyle(color: Color(0xff4B49Ac)),
          backgroundColor: const Color(0xffFFFFFF),
          borderColor: Colors.transparent,
          header: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 0, top: 20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                ),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        "چند فروشندگی ادمین ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(
                        height: 20,
                        color: Colors.grey.shade300,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          items: [
            const AdminMenuItem(
                title: "فروشندگان",
                route: VendorsScreen.id,
                icon: CupertinoIcons.person_3),
            const AdminMenuItem(
                title: "خریداران",
                route: BuyersScreen.id,
                icon: CupertinoIcons.person),
            const AdminMenuItem(
                title: "سفارشات",
                route: OrdersScreen.id,
                icon: CupertinoIcons.shopping_cart),
            const AdminMenuItem(
                title: "دسته بندی",
                route: CategoryScreen.id,
                icon: Icons.category),
            const AdminMenuItem(
                title: " بارگزاری بنر ",
                route: UploadBannerScreen.id,
                icon: Icons.upload),
            const AdminMenuItem(
                title: "محصولات", route: ProductsScreen.id, icon: Icons.store),
          ],
          selectedRoute: VendorsScreen.id,
          onSelected: (item) {
            screenSelector(item);
          },
        ),
      ),
    );
  }
}

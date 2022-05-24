import 'package:adsapp/components/NotificationBadge.dart';
import 'package:adsapp/components/StoreWidget.dart';
import 'package:adsapp/components/drawer.dart';
import 'package:adsapp/models/Store.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  Store store1 =
      Store("Myntra", "99% Positive Sellers", "assets/images/myntra.png");
  Store store2 =
      Store("Flipkart", "99% Positive Sellers", "assets/images/flipkart.png");
  Store store3 =
      Store("Amazon", "99% Positive Sellers", "assets/images/amazon.png");
  Store store4 =
      Store("Swiggy", "99% Positive Sellers", "assets/images/swiggy.png");
      
  @override
  Widget build(BuildContext context) {
    List<Store> _stores = [
      store1,
      store2,
      store3,
      store4,
      store1,
      store2,
      store3,
      store4,
    ];
    return Scaffold(
      key: _drawerKey,
      drawer: CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _drawerKey.currentState?.openDrawer(),
          icon: Icon(Icons.sort),
        ),
        title: Text("Stores"),
        automaticallyImplyLeading: false,
        actions: [
          NotificationBadge(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.separated(
          itemCount: _stores.length,
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemBuilder: (context, index) {
            return StoreWidget(store: _stores[index]);
          },
        ),
      ),
    );
  }
}

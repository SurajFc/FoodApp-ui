import 'package:flutter/material.dart';
import 'package:foodApp/constant.dart';
import 'package:foodApp/models/restaurant.dart';
import 'package:foodApp/screens/Cart.dart';
import 'package:foodApp/widgets/nearby_restaurant.dart';
import '../widgets/search.dart';
import '../widgets/recent_order.dart';
import 'package:foodApp/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurant() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        NearbyRestaurant(restaurant),
      );
    });
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () {
            print('Account pressed');
          },
        ),
        title: Text('Food App'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Cart (${currentUser.cart.length})',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchWidget(),
          ),
          RecentOrder(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Nearby Restaurant',
                  style: kTextStyle,
                ),
                _buildRestaurant(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

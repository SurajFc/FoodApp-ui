import 'package:flutter/material.dart';
import 'package:foodApp/data.dart';
import 'package:foodApp/models/food.dart';
import 'package:foodApp/models/restaurant.dart';
import 'package:foodApp/utils/rating_stars.dart';
import 'package:foodApp/utils/textStyle.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItemFood(Food menuItems) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(menuItems.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.9,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: <Widget>[
                CustomTextStyle(
                  text: menuItems.name,
                  size: 24.0,
                  spacing: 1.2,
                  color: Colors.white,
                  font: FontWeight.bold,
                ),
                CustomTextStyle(
                  text: '\$ ${menuItems.price.toString()}',
                  size: 18.0,
                  spacing: 1.2,
                  color: Colors.white,
                  font: FontWeight.bold,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              width: 48.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  size: 32.0,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  image: AssetImage(
                    widget.restaurant.imageUrl,
                  ),
                  height: 220.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: Colors.red,
                      iconSize: 35.0,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomTextStyle(
                      text: widget.restaurant.name,
                      size: 22.0,
                      font: FontWeight.w600,
                    ),
                    CustomTextStyle(
                      text: '1Km Away',
                      size: 18.0,
                    ),
                  ],
                ),
                RatingStars(widget.restaurant.rating),
                SizedBox(
                  height: 6.0,
                ),
                CustomTextStyle(
                  text: widget.restaurant.address,
                  size: 18.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CutomFlatButton(text: 'Reviews'),
                    CutomFlatButton(text: 'Contact'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Center(
            child: CustomTextStyle(
              text: 'Menu',
              size: 22.0,
              font: FontWeight.w600,
              spacing: 1.2,
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItemFood(food);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class CutomFlatButton extends StatelessWidget {
  final String text;

  CutomFlatButton({this.text});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: CustomTextStyle(
        text: text,
        color: Colors.white,
        size: 20.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

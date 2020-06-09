import 'package:flutter/material.dart';
import 'package:foodApp/models/restaurant.dart';
import 'package:foodApp/screens/RestaurantScreen.dart';
import 'package:foodApp/utils/rating_stars.dart';
import 'package:foodApp/utils/textStyle.dart';

class NearbyRestaurant extends StatelessWidget {
  final Restaurant restaurant;
  NearbyRestaurant(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('argu==> $restaurant');

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RestaurantScreen(restaurant: restaurant),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 1.0,
            color: Colors.grey[200],
          ),
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Hero(
                tag: restaurant.imageUrl,
                child: Image(
                  image: AssetImage(restaurant.imageUrl),
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomTextStyle(
                      text: restaurant.name,
                      size: 20.0,
                      font: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    RatingStars(restaurant.rating),
                    SizedBox(
                      height: 4.0,
                    ),
                    CustomTextStyle(
                      text: restaurant.address,
                      size: 16.0,
                      font: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    CustomTextStyle(
                      text: '1 km away ',
                      size: 16.0,
                      font: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

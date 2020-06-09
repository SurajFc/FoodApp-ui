import 'package:flutter/material.dart';
import 'package:foodApp/data.dart';
import 'package:foodApp/utils/textStyle.dart';
import '../models/order.dart';
import '../constant.dart';

class RecentOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Order',
            style: kTextStyle,
          ),
        ),
        Container(
          height: 120.0,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return ListRecentOrder(order: order);
            },
          ),
        )
      ],
    );
  }
}

class ListRecentOrder extends StatelessWidget {
  final Order order;
  ListRecentOrder({this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 320.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 0.8,
          color: Colors.grey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image(
                    height: 100.0,
                    width: 100.0,
                    image: AssetImage(
                      order.food.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomTextStyle(
                          text: order.food.name,
                          size: 18.0,
                          font: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        CustomTextStyle(
                          text: order.restaurant.name,
                          size: 16.0,
                          font: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        CustomTextStyle(
                          text: order.date,
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
          Container(
            margin: EdgeInsets.only(right: 20.0),
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
        ],
      ),
    );
  }
}

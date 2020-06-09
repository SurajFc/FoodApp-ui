import 'package:flutter/material.dart';
import 'package:foodApp/data.dart';
import 'package:foodApp/models/order.dart';
import 'package:foodApp/utils/textStyle.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: EdgeInsets.all(10.0),
      height: 170.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(order.food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
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
                          font: FontWeight.bold,
                          size: 20.0,
                        ),
                        SizedBox(height: 10.0),
                        CustomTextStyle(
                          text: order.restaurant.name,
                          size: 16.0,
                          font: FontWeight.w600,
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 0.8,
                              color: Colors.black54,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                child: CustomTextStyle(
                                  text: '-',
                                  color: Theme.of(context).primaryColor,
                                  size: 20.0,
                                  font: FontWeight.w600,
                                ),
                                onTap: () {},
                              ),
                              SizedBox(width: 20.0),
                              CustomTextStyle(
                                text: order.quantity.toString(),
                                size: 20.0,
                                font: FontWeight.w600,
                              ),
                              SizedBox(width: 20.0),
                              GestureDetector(
                                child: CustomTextStyle(
                                  text: '+',
                                  color: Theme.of(context).primaryColor,
                                  size: 20.0,
                                  font: FontWeight.w600,
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: CustomTextStyle(
              text: '\$ ${order.quantity * order.food.price}',
              size: 16.0,
              font: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalprice = 0;
    currentUser.cart.forEach((Order order) {
      totalprice += order.quantity + order.food.price;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${currentUser.cart.length})'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildCartItem(order);
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomTextStyle(
                      text: 'Estimated Delivery time:',
                      size: 20.0,
                      font: FontWeight.w600,
                    ),
                    CustomTextStyle(
                      text: '25 min',
                      size: 20.0,
                      font: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomTextStyle(
                      text: 'Total Cost',
                      size: 20.0,
                      font: FontWeight.w600,
                    ),
                    CustomTextStyle(
                      text: '\$ ${totalprice.toStringAsFixed(2)}',
                      size: 20.0,
                      color: Colors.green[700],
                      font: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 82.0),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1.0,
            color: Colors.grey,
          );
        },
        itemCount: currentUser.cart.length + 1,
      ),
      bottomSheet: Container(
        height: 100.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
          child: FlatButton(
            child: CustomTextStyle(
              text: 'CHECKOUT',
              color: Colors.white,
              size: 22.0,
              font: FontWeight.bold,
              spacing: 2.0,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

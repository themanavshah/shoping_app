import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

//import 'package:Shopin/screens/cart_screen.dart';
import '../helpers/custom_route.dart';
import '../providers/auth.dart';
import '../screens/orders_screen.dart';
import '../screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello jack!'),
            automaticallyImplyLeading: false,
          ),
          Divider(
            indent: 15,
            endIndent: 15,
            color: Colors.black45,
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          Divider(
            indent: 15,
            endIndent: 15,
            color: Colors.black45,
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
              // Navigator.of(context).pushReplacement(
              //   CustomRoute(
              //     builder: (ctx) => OrdersScreen(),
              //   ),
              // );
            },
          ),
          Divider(
            indent: 15,
            endIndent: 15,
            color: Colors.black45,
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Products'),
            onTap: () {
              Navigator.of(context).pushNamed(UserProductScreen.routeName);
            },
          ),
          Divider(
            indent: 15,
            endIndent: 15,
            color: Colors.black45,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              // Navigator.of(context).pushNamed(UserProductScreen.routeName);
              Provider.of<Auth>(
                context,
                listen: false,
              ).logout();
            },
          ),
        ],
      ),
    );
  }
}

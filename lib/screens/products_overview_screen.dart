import 'package:Shopin/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import '../screens/cart_screen.dart';
import '../providers/cart.dart';
import '../widgets/products_grid.dart';

enum FilterOprions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var showFvoritesOnly = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchandSetProduct(); //that will not work.
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchandSetProduct();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchandSetProduct().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopin'), actions: <Widget>[
        PopupMenuButton(
          onSelected: (FilterOprions selectedValue) {
            setState(() {
              if (selectedValue == FilterOprions.Favorites) {
                showFvoritesOnly = true;
              } else {
                showFvoritesOnly = false;
              }
            });
          },
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
                child: Text('Favorites'), value: FilterOprions.Favorites),
            PopupMenuItem(child: Text('Show All'), value: FilterOprions.All),
          ],
        ),
        Consumer<Cart>(
          builder: (_, cartData, __) => Badge(
            child: __,
            value: cartData.itemCount.toString(),
          ),
          child: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        )
      ]),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductGrid(showFvoritesOnly),
    );
  }
}

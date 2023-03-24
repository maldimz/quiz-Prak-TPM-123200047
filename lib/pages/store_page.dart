import 'package:flutter/material.dart';
import 'package:quiz_123200047/data/groceries.dart';
import 'package:quiz_123200047/pages/store_detail.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  var groceryFavorite = <Groceries>[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Griceries Store'),
        ),
        body: ListView.builder(
            itemCount: groceryList.length,
            itemBuilder: (context, index) {
              final Groceries grocery = groceryList[index];
              return ListTile(
                leading: Image.network(
                  grocery.productImageUrls[0],
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: Text('${grocery.name}'),
                subtitle: Text('${grocery.storeName}'),
                trailing: Text('Rp ${grocery.price}'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => StoreDetail(
                          grocery: grocery, favorite: groceryFavorite)));
                },
              );
            }),
      ),
    );
  }
}

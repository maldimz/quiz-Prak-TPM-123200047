import 'package:flutter/material.dart';
import 'package:quiz_123200047/data/groceries.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreDetail extends StatefulWidget {
  final Groceries grocery;
  final List<Groceries> favorite;
  const StoreDetail({Key? key, required this.grocery, required this.favorite})
      : super(key: key);

  @override
  State<StoreDetail> createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {
  bool isFavorite = false;

  setFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        widget.favorite.add(widget.grocery);
      } else {
        widget.favorite.remove(widget.grocery);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    isFavorite = widget.favorite.contains(widget.grocery);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.grocery.name}'),
          actions: [
            IconButton(
                onPressed: () {
                  launch(widget.grocery.productUrl);
                  print(widget.grocery.productUrl);
                },
                icon: const Icon(Icons.share))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.grocery.productImageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              widget.grocery.productImageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                setFavorite();
                              },
                              icon: Icon(Icons.favorite,
                                  color: isFavorite ? Colors.red : Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.money),
                            Text(
                              'Rp ${widget.grocery.price}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.star),
                            Text(
                              '${widget.grocery.reviewAverage}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.shopping_cart),
                            Text(
                              '${widget.grocery.stock}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.discount),
                            Text(
                              '${widget.grocery.discount}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Description: ${widget.grocery.description}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

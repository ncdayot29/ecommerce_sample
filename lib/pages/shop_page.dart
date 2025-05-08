import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/flower_tile.dart';
import '../models/Flower.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addFlowerToCart(Flower flower) {
    Provider.of<Cart>(context, listen: false).addItemToCart(flower);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) => Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey, 
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Search',
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            'Flowers are like friends; they bring color to your world.',
            style: TextStyle(color: Colors.black),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Popular💐',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10,),

        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Flower flower = value.getFlowerList()[index];
              return FlowerTile(
                flower: flower,
                onTap: () => addFlowerToCart(flower),
              );
            }, 
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(
            top: 25.0,
            left: 25,
            right: 25,
          ),
          child: Divider(
            color: Colors.white,
          ),
        ),
      ],
    ) );
  }
}
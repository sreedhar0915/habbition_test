import 'package:flutter/material.dart';
import 'package:habbition_test/view/Global_widget/Product_card.dart';
import 'package:habbition_test/view/Productdetail_screen/productdetail_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Category Name",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        actions: [
          Container(
            height: 26,
            width: 26,
            child: Image.asset("Assets/Images/image 10.png"),
          ),
          SizedBox(width: 5)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                hintText: "Search for category",
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.6,
                    crossAxisCount: 2),
                itemCount: 12,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductdetailScreen(),
                        ));
                  },
                  child: ProductCard(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

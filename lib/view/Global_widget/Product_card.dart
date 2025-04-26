import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productimage;
  final String productname;
  final String productdetails;
  final String productprice;
  const ProductCard(
      {super.key,
      required this.productname,
      required this.productimage,
      required this.productdetails,
      required this.productprice});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218,
      width: 155,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                productimage,
                height: 150,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
                top: 5,
                right: 0,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_border,
                      color: Colors.green,
                    )))
          ]),
          Text(
            productname,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 5),
          Text(
            productdetails,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "₹ ${productprice}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Container(
                  height: 29,
                  width: 33.83,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}

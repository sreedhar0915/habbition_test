import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

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
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "Assets/Images/Rectangle 485.png",
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
            "BP Monitor",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 5),
          Text(
            "Accurate and easy-to-use digital blood pressure......",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "₹ 3,500",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Container(
                height: 29,
                width: 33.83,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    onPressed: () {},
                    icon: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

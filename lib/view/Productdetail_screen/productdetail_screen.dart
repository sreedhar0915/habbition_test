import 'package:flutter/material.dart';

class ProductdetailScreen extends StatelessWidget {
  const ProductdetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 245,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage("Assets/Images/Rectangle 500.png"),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    height: 36,
                    width: 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(41, 153, 55, 1)),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    height: 36,
                    width: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.green,
                      ),
                    ),
                  ),
                )
              ]),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("BP Monitor",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Text("₹ 3,500",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(41, 153, 55, 1))),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    height: 36,
                    width: 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("Assets/Images/Frame (2).png"))),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 36,
                    width: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text("0"),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 36,
                    width: 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("Assets/Images/Frame (3).png"))),
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 149,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(37),
                        color: Colors.green),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          SizedBox(width: 20),
                          Text(
                            "Add to cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:habbition_test/Utilis/Colorconstant.dart';

class ProductdetailScreen extends StatefulWidget {
  final String productimage;
  final String productname;
  final String productdetails;
  final String productprice;

  const ProductdetailScreen(
      {super.key,
      required this.productname,
      required this.productimage,
      required this.productdetails,
      required this.productprice});

  @override
  State<ProductdetailScreen> createState() => _ProductdetailScreenState();
}

class _ProductdetailScreenState extends State<ProductdetailScreen> {
  int quantity = 0;
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
                      color: ColorConstants.white,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: NetworkImage(widget.productimage),
                          fit: BoxFit.contain)),
                ),
                Positioned(
                  top: 6,
                  left: 5,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 36,
                      width: 33,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(41, 153, 55, 1)),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: ColorConstants.white,
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
                  Text(widget.productname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Text(widget.productprice,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(41, 153, 55, 1))),
                ],
              ),
              SizedBox(height: 10),
              Text(
                widget.productdetails,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: ColorConstants.grey, fontSize: 12),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        quantity--;
                      });
                    },
                    child: Container(
                      height: 36,
                      width: 33,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image:
                                  AssetImage("Assets/Images/Frame (2).png"))),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 36,
                    width: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: ColorConstants.black),
                    ),
                    child: Center(
                      child: Text(quantity.toString()),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: Container(
                      height: 36,
                      width: 33,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image:
                                  AssetImage("Assets/Images/Frame (3).png"))),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 50,
                    width: 149,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(37),
                        color: ColorConstants.maincolor),
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

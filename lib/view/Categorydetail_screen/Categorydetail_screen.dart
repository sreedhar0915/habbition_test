import 'package:flutter/material.dart';
import 'package:habbition_test/Controller/Categoryscreen_controller.dart';
import 'package:habbition_test/Utilis/Colorconstant.dart';
import 'package:habbition_test/view/Global_widget/Product_card.dart';
import 'package:habbition_test/view/Productdetail_screen/productdetail_screen.dart';
import 'package:provider/provider.dart';

class CategorydetailScreen extends StatefulWidget {
  final String heading;
  final int categoryId;
  const CategorydetailScreen({
    super.key,
    required this.heading,
    required this.categoryId,
  });

  @override
  State<CategorydetailScreen> createState() => CategorydetailScreenState();
}

class CategorydetailScreenState extends State<CategorydetailScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CategoryscreenController>().fetchproducts();
        context
            .read<CategoryscreenController>()
            .fetchProductsByCategory(widget.categoryId);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.heading,
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
      body: Consumer<CategoryscreenController>(
        builder: (context, value, child) => value.isLoadings
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 47,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: ColorConstants.white,
                            boxShadow: const [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  color: ColorConstants.grey,
                                  offset: Offset(0, 3))
                            ],
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            fillColor: ColorConstants.white,
                            prefixIcon: Icon(Icons.search),
                            label: Text("Search for Category"),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20,
                                  childAspectRatio: 0.6,
                                  crossAxisCount: 2),
                          itemCount: value.ProductList.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductdetailScreen(
                                      productimage: value.ProductList[index]
                                                      .images !=
                                                  null &&
                                              value.ProductList[index].images!
                                                  .isNotEmpty
                                          ? value.ProductList[index].images![0]
                                          : "",
                                      //value.ProductList[index].images![index],
                                      productname: value
                                          .ProductList[index].title
                                          .toString(),
                                      productdetails: value
                                          .ProductList[index].description
                                          .toString(),
                                      productprice: value
                                          .ProductList[index].price
                                          .toString(),
                                    ),
                                  ));
                            },
                            child: ProductCard(
                              productimage:
                                  value.ProductList[index].images != null &&
                                          value.ProductList[index].images!
                                              .isNotEmpty
                                      ? value.ProductList[index].images![0]
                                      : "",
                              // value.ProductList[index].images.toString(),
                              productname:
                                  value.ProductList[index].title.toString(),
                              productdetails: value
                                  .ProductList[index].description
                                  .toString(),
                              productprice:
                                  value.ProductList[index].price.toString(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

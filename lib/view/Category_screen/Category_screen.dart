import 'package:flutter/material.dart';
import 'package:habbition_test/Controller/Categoryscreen_controller.dart';
import 'package:habbition_test/Utilis/Colorconstant.dart';
import 'package:habbition_test/view/Categorydetail_screen/Categorydetail_screen.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CategoryscreenController>().fetchCategories();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CategoryscreenController>(
        builder: (context, value, child) => value.isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
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
                            borderSide: BorderSide(color: ColorConstants.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: ColorConstants.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 1.9,
                                crossAxisCount: 2),
                        itemCount: value.categoryList.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategorydetailScreen(
                                    heading: value.categoryList[index].name
                                        .toString(),
                                    categoryId: value.categoryList[index].id!,
                                  ),
                                ));
                          },
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorConstants.black,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "Assets/Images/background image.jpeg"),
                                  fit: BoxFit.cover),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                  child: Text(
                                value.categoryList[index].name.toString(),
                                maxLines: 1,
                                overflow:
                                    TextOverflow.ellipsis, //call category list
                                style: TextStyle(
                                    color: ColorConstants.white,
                                    fontSize: 16.77,
                                    fontWeight: FontWeight.w600),
                              )),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

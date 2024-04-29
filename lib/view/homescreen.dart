

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:monday15/controller/homescreencontroller.dart';
import 'package:monday15/view/imageloading/loading.dart';
import 'package:monday15/view/second/detailscreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<HomeScreenController>(context,listen: false).getCategoryData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProviderObj = Provider.of<HomeScreenController>(context);
    return DefaultTabController(length: ProviderObj.categories.length,
      child: Scaffold(appBar:
       AppBar(bottom: TabBar
       (isScrollable: true,
       onTap: (value) {
       context.read<HomeScreenController>().CategorySelection(value);
  
      },
      tabs:List.generate(ProviderObj.categories.length, (index) => Tab(
        child: Text("${ProviderObj.categories[index].toUpperCase()}"),
      ))),),
       
  body: ProviderObj.isloading?
  Center(
    child: Loading(),
  ):ListView.builder(itemCount: ProviderObj.resCategory?.articles?.length?? 0,
  itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child:InkWell(
         onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailNewsScreen(
                                      articles: ProviderObj
                                          .resCategory?.articles?[index]),
                                ));
                          },
        child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 102, 123, 141),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  CachedNetworkImage(
                                    height: 200,
                                    imageUrl:   "${ProviderObj.resCategory?.articles?[index].urlToImage}",
                                    errorWidget: (context, url, error) => Image.asset(
                                        "assets/images/no image.png"),
                                  ),
                                  Text(
                                      "${ProviderObj.resCategory?.articles?[index].title?.toUpperCase()}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                              
                                ],
                              ),
                            ),
      ),
                        );
  })));
                    }
}
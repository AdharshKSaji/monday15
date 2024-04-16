

import 'package:flutter/material.dart';
import 'package:monday15/controller/homescreencontroller.dart';
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
    child: CircularProgressIndicator(),
  ):ListView.builder(itemCount: ProviderObj.resCategory?.articles?.length?? 0,
  itemBuilder: (context, index) {
    return Container(
      color: Colors.blue.shade100 ,
      child: Column(
        children:[Container(
          height: 200,width: double.infinity,
          child:  Image.network("${ProviderObj.resCategory?.articles?[index].urlToImage}",
        fit: BoxFit.fill,),
      ),
      
   
    Text("${ProviderObj.resCategory?.articles?[index].title?.toUpperCase()}"),
   ]) );
  })
    ));
  
  }
      
  }


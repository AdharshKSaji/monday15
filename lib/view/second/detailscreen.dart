
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:monday15/model/newsapimodel.dart';


class DetailNewsScreen extends StatelessWidget {
  DetailNewsScreen({super.key, required this.articles});

  final Article? articles;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              CachedNetworkImage(
                height: 200,
                imageUrl: "${articles?.urlToImage}",
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/no image.png"),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                articles?.title ?? "",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                articles?.description ?? "",
                
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Text("Read More"))
            ],
          ),
        ),
      ),
    );
  }
}
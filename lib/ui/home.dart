import 'package:api_test/models/news.dart';
import 'package:api_test/provider/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Articles> data = [];
  late NewsProvider newsListprovider;
  @override
  void initState() {
    super.initState();
    newsListprovider = Provider.of<NewsProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = newsListprovider.fetchNewsData();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "News",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 33, 50, 236),
        ),
        body: Consumer<NewsProvider>(
          builder: (context, value, child) => Provider.value(
            value: newsProvider,
            child: ListView.builder(
              itemCount: value.articlesList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        value.articlesList[index].title.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                          value.articlesList[index].urlToImage.toString()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          value.articlesList[index].author.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          value.articlesList[index].publishedAt.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        value.articlesList[index].description.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        value.articlesList[index].content.toString(),
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 1,
                      ),
                    )
                  ],
                );
              },
            ),

            /* ElevatedButton(
                onPressed: () {
                  print("DAttttttt : ${value.articlesList[0].author}");
                },
                child: Text("Click"),
              ) */
          ),
        ));
  }
}

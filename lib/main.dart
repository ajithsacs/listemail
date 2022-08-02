import 'package:flutter/material.dart';
import 'package:listemail/api/apicall.dart';

void main() {
  runApp(MaterialApp(
    title: 'Agilex Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MyListView(),
  ));
}

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Api List")),
        body: FutureBuilder<List<ApiCall>>(
          future: getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Mylistview(data: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text("Error has occured${snapshot.error}");
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}

class Mylistview extends StatelessWidget {
  const Mylistview({super.key, required this.data});
  final List<ApiCall> data;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.only(bottom: 10),
            // width: MediaQuery.of(context).size.width * 0.2,
            child: Row(
              children: [
                CircleAvatar(
                  child: Text(
                    data[index].title[0].toUpperCase(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  backgroundColor: Colors.lightGreenAccent,
                ),
                Text("  "),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        data[index].title.toUpperCase(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Text(
                        data[index].body,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Text(data[index].body),
                  ],
                )

                //Text(data.toString()),
              ],
            ));
      },
    );
  }
}

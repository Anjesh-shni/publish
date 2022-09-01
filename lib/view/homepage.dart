import 'package:flutter/material.dart';
import 'package:publish/model/post_model.dart';
import 'package:publish/server/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Comment>? post;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    post = await Api().getPost();
    if (post != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post data'),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
      ),
      body: post == null
          ? Center(
              child: Container(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
            )
          : Container(
              child: ListView.builder(
                  itemCount: post!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10, bottom: 10),
                      child: ListTile(
                        leading: Text('${post![index].id}'),
                        title: Text(post![index].name),
                        subtitle: Text(post![index].email),
                      ),
                    );
                  }),
            ),
    );
  }
}

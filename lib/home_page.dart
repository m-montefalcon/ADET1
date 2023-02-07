import 'package:flutter/material.dart';
import 'package:practice/form_page.dart';
import 'package:practice/student.dart';

import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Technology and Immersive Technology'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(30.00),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
              ),
              key: UniqueKey(),
              onDismissed: (dismiss) {
                setState(() {
                  data.removeAt(index);
                });
              },
              child: Card(
                elevation: 10,
                shadowColor: Colors.blueAccent,
                child: ListTile(
                  leading: const Icon(Icons.account_box_rounded),
                  title: Text(data[index].name),
                  subtitle: Text(data[index].id.toString()),
                  trailing: const Icon(Icons.delete_sweep_rounded),
                  onTap: () async {
                    var passNewStudent = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(studentDetails: data[index])
                        )
                    );
                    setState(() {
                      data.addAll(passNewStudent);
                    });
                  },
                ),
              )
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Student getDetails = await Navigator.push(
              context,
            MaterialPageRoute(
                builder: (context) => const FormPage()
            )
          );
          setState(() {
            if(getDetails.id != null) {
              data.add(getDetails);
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

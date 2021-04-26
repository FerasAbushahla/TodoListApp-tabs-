import 'package:assignment3/constants.dart';
import 'package:assignment3/new_Task.dart';
import 'package:assignment3/task_model.dart';
import 'package:assignment3/task_widget.dart';
import 'package:flutter/material.dart';

import 'db_helper.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

Future<String> getData() async {}

class _TabsPageState extends State<TabsPage> {
  myFun() {
    return setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Todo'),
            bottom: TabBar(
              tabs: <Widget>[
                Text('All Tasks'),
                Text('Complete Tasks'),
                Text('InComplete Tasks')
                // Column(
                //   children: [
                //     Icon(Icons.pageview),
                //     Text('Icons and Text'),
                //   ],
                // )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: Container(
                    child: SingleChildScrollView(
                  child: Column(
                    children:
                        tasksList.map((e) => TaskWidget(e, myFun)).toList(),
                    //DBHelper.dbHelper.selectAllTasks(),
                    //       FutureBuilder(
                    //         future: DBHelper.dbHelper.selectAllTasks(),
                    //         builder: (context, snapshot) {
                    //           return ListView.builder(
                    //             shrinkWrap: true,
                    //             itemCount: DBHelper.dbHelper.selectAllTasks().,
                    //             itemBuilder: (context, index) {
                    //             return TaskItem(
                    //               task: Task(
                    //                 id:DBHelper.allTasks[index]['id'],
                    //                 taskName: DBHelper.allTasks[index]['name'],
                    //                 isCompleted: DBHelper.allTasks[index]['isComplete']),
                    //         );
                    //       },
                    //     );
                    //   },
                    // ),
                    //],
                  ),
                )),
              ),
              Container(
                  child: Container(
                child: SingleChildScrollView(
                  child: Column(
                      children: tasksList
                          .where((element) => element.isComplete == true)
                          .map((e) => TaskWidget(e, myFun))
                          .toList()),
                ),
              )),
              Container(
                  child: Container(
                child: SingleChildScrollView(
                  child: Column(
                      children: tasksList
                          .where((element) => element.isComplete == false)
                          .map((e) => TaskWidget(e, myFun))
                          .toList()),
                ),
              )),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return NewTask();
                },
              ));
            },
            child: Icon(Icons.add_sharp),
            backgroundColor: Colors.blue,
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tasklist_app/data/datasources/task_remote_datasource.dart';
import 'package:flutter_tasklist_app/data/models/task_response_model.dart';
import 'package:flutter_tasklist_app/pages/detail_task_page.dart';
// import 'package:flutter/widgets.dart';
import 'add_task_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Menampilkan datasources ke halaman home_page
  bool isLoaded = false;
  //Memanggil class task di task_response_model
  List<Task> tasks = [];
  //ambil function data dari datasources
  Future<void> getTasks() async {
    setState(() {
      isLoaded = true;
    });

    final model = await TaskRemoteDatasource().getTasks();
    tasks = model.data;

    setState(() {
      isLoaded = false;
    });
  }

  //menambahkan initstate untuk proses pemamnggilan getTasks
  @override
  void initState() {
    getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task List App',
          style: TextStyle(color: Colors.white),
        ),
        //jika tambah action + di appbar
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.add,
        //       size: 24.0,
        //     ),
        //   ),
        // ],
        elevation: 2, //memberi batas warna appbar
        backgroundColor: Colors.blue,
      ),
      body: isLoaded //tambahkan isLoaded indicator untuk proses menampilkan data
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              //tambahkan padding untuk jarak antara listview dan listtile
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              itemBuilder: (context, index) {
                return InkWell(
                  //menambahkan inkwell untuk mengarahkan ke halaman detail_task_page
                  onTap: () {
                    //mengarahkan ke halaman detail_task_page
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const DetailTaskPage();
                    }));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(tasks[index].attributes.title),
                      subtitle: Text(tasks[index].attributes.description),
                      trailing: IconButton(
                        icon: const Icon(Icons.check_circle),
                        onPressed: () {},
                      ),
                    ),
                  ),
                );
              },
              itemCount: tasks.length, //ganti banyaknya data dari list
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //mengarahkan ke halaman add_task_page
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddTaskPage();
          }));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

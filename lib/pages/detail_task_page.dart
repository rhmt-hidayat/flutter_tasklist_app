import 'package:flutter/material.dart';
import 'package:flutter_tasklist_app/pages/edit_task_page.dart';

class DetailTaskPage extends StatefulWidget {
  const DetailTaskPage({super.key});

  @override
  State<DetailTaskPage> createState() => _DetailTaskPageState();
}

class _DetailTaskPageState extends State<DetailTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Task Page',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 2, //memberi batas warna appbar
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        //memberi batas input
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        children: [
          const Text('Title'),
          const SizedBox(height: 16.0),
          const Text('Description'),
          const SizedBox(height: 16.0),
          //tombol action dibungkus dengan widget Row
          Row(
            //agar posisi ditengah pake mainAxisAlignment
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                //penggunaan style edit button untuk memberi warna dan ukuran
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white, //text color
                ),
                onPressed: () {
                  //mengarahkan ke halaman edit task page
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const EditTaskPage();
                  }));
                },
                child: const Text('Edit'),
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                //penggunaan style delete button untuk memberi warna dan ukuran
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white, //text color
                ),
                onPressed: () {
                  //mengarahkan ke halaman home_page
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

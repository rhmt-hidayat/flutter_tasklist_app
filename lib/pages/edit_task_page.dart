import 'package:flutter/material.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({super.key});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Task Page',
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
          ElevatedButton(
            onPressed: () {
              //mengarahkan ke halaman home_page
              Navigator.pop(context);
            },
            child: const Text('Edit Task'),
          ),
        ],
      ),
    );
  }
}
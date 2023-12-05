import 'package:flutter/material.dart';

class Reviewscreen extends StatelessWidget {
  const Reviewscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black54),
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: 100,
        child: SingleChildScrollView(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
            return const ListTile(
              leading: Row(
                children: [
                  Icon(Icons.person,color: Colors.black,),
                  Text('Remon Howlader',style: TextStyle(color: Colors.black),),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

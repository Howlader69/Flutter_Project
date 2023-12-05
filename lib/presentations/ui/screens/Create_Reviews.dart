import 'package:flutter/material.dart';

class CreateReviewsScreen extends StatelessWidget {
  const CreateReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(color: Colors.black,),
          title:Text('Create Reviews',style: TextStyle(color: Colors.black),)),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 40,),
            TextFormField(
                 decoration: InputDecoration(
                   hintText: 'First Name'
                 ),
            ),
            SizedBox(height: 8,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Last Name'
              ),
            ),
            SizedBox(height: 8,),
            TextFormField(
              maxLines: 6,
              decoration: InputDecoration(
                  hintText: 'Write Reviews'
              ),
            ),
            SizedBox(height: 16,),
            SizedBox(
              width: double.infinity,
                child: ElevatedButton(onPressed: (){}, child: Text('Submit')))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Comment {
  final String username;
  final String content;
  final String date;

  Comment({required this.username, required this.content, required this.date});
}

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

// TODO : this list will probably be replace by a service that will get the comment from the vehicule id
class _CommentsPageState extends State<CommentsPage> {
  List<Comment> comments = [
    Comment(username: 'User1', content: 'This is a comment.', date: '31/12/2023'),
    Comment(username: 'User2', content: 'This is another comment.', date: '01/01/2024'),
    // Add more comments as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue,
        title: Text('Commentaires', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications, color: Colors.black))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 7,),
              Padding(
                padding: const EdgeInsets.only(right:290),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back, color: Colors.black45,size: 30,)),
              ),
              SizedBox(height: 17),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: comments.map((comment) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.black45,
                                    ),
                                    SizedBox(width: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(comment.username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                    )
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  comment.content,
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 4,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 250),
                                  child: Text(comment.date, style: TextStyle(color: Colors.lightGreen, fontSize: 12),),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,), // Add space between each comment widget
                      ],
                    );
                  }).toList(),
                )
              ),

            ],
          ),
        ),
      ),
    );
  }
}

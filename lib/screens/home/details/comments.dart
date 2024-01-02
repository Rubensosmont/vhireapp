import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vhireapp/models/comment.dart';
import 'package:vhireapp/shared/loading.dart';

class CommentsPage extends StatefulWidget {

  final String vehicle_id;

  const CommentsPage({super.key, required this.vehicle_id});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {

  List<Comment> comments = [];
  bool _isLoading = true;

  Future<void> loadComments() async {
    setState(() => _isLoading = true );
    comments = await Comment.getCommentByVehicleID(widget.vehicle_id);
    comments.sort((Comment a, Comment b) => b.created_at.compareTo(a.created_at));
    setState(() => _isLoading = false );
  }

  @override
  void initState() {
    super.initState();
    loadComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (!_isLoading) ? SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: comments.map((Comment comment) {
                      return (comment.deleted_at == null) ? Column(
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
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          padding: const EdgeInsets.only(top: 12),
                                          child: Text(
                                            comment.username,
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 4,),
                                  Text(
                                    comment.content!,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 4,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(DateFormat("dd/MM/yy HH:mm").format(comment.created_at.toDate()), style: TextStyle(color: Colors.lightGreen, fontSize: 12),),
                                    ]
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,), // Add space between each comment widget
                        ],
                      ) : const SizedBox();
                    }).toList(),
                  )
              ),

            ],
          ),
        ),
      ) : const Loading(),
    );
  }
}

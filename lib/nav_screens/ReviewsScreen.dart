
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  double _rating = 0.0;
  int _totalVotes = 100;
  int _fiveStarVotes = 60;
  int _fourStarVotes = 20;
  int _threeStarVotes = 10;
  int _twoStarVotes = 5;
  int _oneStarVotes = 5;
  int yes=8736;
  int no=520;

  TextEditingController _menuChangesController = TextEditingController();
  TextEditingController _timingChangesController = TextEditingController();
  TextEditingController _cleanlinessController = TextEditingController();
  TextEditingController _varietyOfDishesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review and Complaints'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Register complaints',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                margin: EdgeInsets.only(right: 10),
                color: Colors.white,
                elevation: 15,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreatePostScreen()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Icon(
                              Icons.comment,
                              size: 50,
                              color: Color.fromARGB(255, 150, 160, 190),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Complaints',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'To register a mess complaint, click here',
                                  style: TextStyle(color: Color.fromARGB(255, 150, 160, 190)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Mess Review',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Rate the mess',
                  style: TextStyle(fontSize: 17),
                ),
              ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _rating = 1.0;
                          });
                        },
                        child: Icon(
                          _rating >= 1 ? Icons.star : Icons.star_border,
                          size: 40,
                          color: Colors.orange,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _rating = 2.0;
                          });
                        },
                        child: Icon(
                          _rating >= 2 ? Icons.star : Icons.star_border,
                          size: 40,
                          color: Colors.orange,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _rating = 3.0;
                          });
                        },
                        child: Icon(
                          _rating >= 3 ? Icons.star : Icons.star_border,
                          size: 40,
                          color: Colors.orange,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _rating = 4.0;
                          });
                        },
                        child: Icon(
                          _rating >= 4 ? Icons.star : Icons.star_border,
                          size: 40,
                          color: Colors.orange,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _rating = 5.0;
                          });
                        },
                        child: Icon(
                          _rating >= 5 ? Icons.star : Icons.star_border,
                          size: 40,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Do you want any changes in the menu?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _menuChangesController,
                    decoration: InputDecoration(
                      hintText: 'Type your response here',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Do you want any changes in mess timings?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _timingChangesController,
                    decoration: InputDecoration(
                      hintText: 'Type your response here',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'How was the cleanliness in the mess?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _varietyOfDishesController,
                    decoration: InputDecoration(
                      hintText: 'Type your response here',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'How was the variety of dishes offered?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _timingChangesController,
                    decoration: InputDecoration(
                      hintText: 'Type your response here',
                    ),
                  ),
              SizedBox(height: 20),
              _buildVotingPercentage(10),
              SizedBox(height: 20),
              _buildVotingPercentage(10),

                ],
              ),
        ),
      ),


      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: InkWell(
            onTap: () {
              saveReview();
            },
            child: Container(
              height: 50.0,
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          color: Color.fromARGB(255, 31, 40, 62), // Use primary color
        ),
      ),

    );
  }

  Widget _buildVotingPercentage(int percentage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 20,
            width: 330,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Row(
              children: [
                Flexible(
                  flex: yes,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                    ),
                  ),
                ),
                Flexible(
                  flex: no,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${yes.toString()} Yes'),
              Text('${no.toString()} Yes'),
            ],
          )
        ],
      ),
    );

  }
  void saveReview() async {
    // Save the review data to Firestore
    try {
      // Save the review data to Firestore
      await FirebaseFirestore.instance.collection('reviews').add({
        'rating': _rating,
        'menuChanges': _menuChangesController.text,
        'timingChanges': _timingChangesController.text,
        'cleanliness': _cleanlinessController.text,
        'varietyOfDishes': _varietyOfDishesController.text,
      });

      // Show success alert dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/success_image.jpg'), // Replace 'assets/success_image.png' with your image asset path
                SizedBox(height: 20),
                Text(
                  'Thank you for the review!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'We value your effort.',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        },
      );
    } catch (error) {
      print('Error saving review: $error');
      // Show error message
    }
  }

}
class PreviousComplaints extends StatefulWidget {
  @override
  _PreviousComplaintsState createState() => _PreviousComplaintsState();
}
Future<String?> getRollNumber() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.setString('rollNumber', rollNumber);
  return prefs.getString('rollNumber');
}
class _PreviousComplaintsState extends State<PreviousComplaints> {

  int _totalVotes = 100;
  List<int> _votingPercentages = [0, 0, 0, 0];
  late String rollNumber;
  void _vote(int index) {
    setState(() {
      _votingPercentages[index] += 1;
    });
  }

  @override
  void initState() {
    super.initState();

    getRollNumber().then((value) {
      setState(() {
        rollNumber = value ?? '';
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Your previous complaints'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No previous complaints available.'));
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var post = snapshot.data?.docs[index];
              if (post == null || post.data() == null) {
                return SizedBox(); // Skip if post data is null
              }
              return PostCard(
                post: post,
                onUpdate: () {
                  setState(() {});
                },
                key: Key(post.id),
              );
            },
          );
        },
      ),

    );
  }
}

class PostCard extends StatefulWidget {
  final QueryDocumentSnapshot post;
  final VoidCallback onUpdate;

  const PostCard({required Key key, required this.post, required this.onUpdate})
      : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late int upvotes;
  late int downvotes;
  late Color upvoteColor;
  late Color downvoteColor;

  @override
  void initState() {
    super.initState();
    upvotes = widget.post['upvotes'] ?? 0;
    downvotes = widget.post['downvotes'] ?? 0;
    upvoteColor = Colors.blue;
    downvoteColor = Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    var username = widget.post['username'] ?? '';
    var content = widget.post['content'] ?? '';
    var imageUrl = widget.post['imageUrl'];

    return Card(
      color: Color.fromARGB(255, 150, 160, 190),
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (imageUrl != null)
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ListTile(
            title: Text(username, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(content),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.check),
                      color: upvoteColor,
                      onPressed: () {
                        setState(() {
                          if (upvoteColor == Colors.blue) {
                            upvotes++;
                            setState(() {
                              upvoteColor = Colors.green;
                            });

                            if (downvoteColor == Colors.green) {
                              downvotes--;
                              downvoteColor = Colors.red;
                            }
                          } else {
                            upvotes--;
                            upvoteColor = Colors.blue;
                          }
                        });
                        FirebaseFirestore.instance
                            .collection('posts')
                            .doc(widget.post.id)
                            .update(
                            {'Seen': upvotes, 'Pending': downvotes});
                        widget.onUpdate(); // Update UI
                      },
                    ),
                    Text('Seen by staff'),
                    IconButton(
                      icon: Icon(Icons.pending),
                      color: downvoteColor,
                      onPressed: () {
                        setState(() {
                          if (downvoteColor == Colors.red) {
                            downvotes++;
                            downvoteColor = Colors.green;
                            if (upvoteColor == Colors.green) {
                              upvotes--;
                              upvoteColor = Colors.blue;
                            }
                          } else {
                            downvotes--;
                            downvoteColor = Colors.red;
                          }
                        });
                        FirebaseFirestore.instance
                            .collection('posts')
                            .doc(widget.post.id)
                            .update(
                            {'Seen': upvotes, 'Pending': downvotes});
                        widget.onUpdate(); // Update UI
                      },
                    ),
                    Text('Pending'),
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: () {
                        // Implement comment functionality
                        // This could navigate to a screen where users can view/add comments
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _contentController = TextEditingController();
  File? _image; // Change to nullable File

  // Rest of the code remains the same
  Future getImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  late String rollNumber;

  @override
  void initState() {
    super.initState();

    getRollNumber().then((value) {
      setState(() {
        rollNumber = value ?? '';
      });
    });
  }
  Future<String?> getRollNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('rollNumber', rollNumber);
    return prefs.getString('rollNumber');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          // Navigate to a screen where user can create a new post
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PreviousComplaints()),
          );
        },
        child: Icon(Icons.history, color: Colors.white,),
      ),
      appBar: AppBar(
        title: Text('Submit complaint'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: getImage,
              child: Container(
                color: Colors.grey[200],
                height: 150,
                child: _image == null // Check if _image is null
                    ? Center(child: Icon(Icons.add_a_photo))
                    : Image.file(_image!,
                    fit: BoxFit
                        .cover), // Use _image! to access non-nullable value
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.secondary),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary),
                  // Change border color when focused
                ),
                labelText: "Please describe your issue briefly",
              ),
              maxLines: 5,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context)
                        .colorScheme
                        .secondary), // Change background color
                minimumSize: MaterialStateProperty.all<Size>(
                    Size(double.infinity, 45)), // Change width
              ),
              onPressed: () async {
                showDialog(
                  context: context,
                  // barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Center(
                      child: CircularProgressIndicator(), // Circular progress indicator
                    );
                  },
                );
                String randomUsername =
                    'Complaint ID ' + Random().nextInt(1000).toString();
                // Upload image if available
                String? imageUrl; // Change to nullable String
                if (_image != null) {
                  final ref = FirebaseStorage.instance
                      .ref()
                      .child('complaint_images')
                      .child('${DateTime.now()}.jpg');
                  final TaskSnapshot snapshot = await ref.putFile(_image!);

                  final downloadUrl = await snapshot.ref.getDownloadURL();

                  // await ref.putFile(_image!);
                  // imageUrl = await ref.getDownloadURL();
                  // Add post to Firestore
                  await FirebaseFirestore.instance.collection('posts').add({
                    'username': randomUsername,
                    'content': _contentController.text,
                    'Seen': 0,
                    'Pending': 0,
                    'imageUrl': downloadUrl,
                  });
                }
                Navigator.pop(
                    context); // Navigate back to the community section
              },
              child: Text(
                'Post',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreen createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  final CollectionReference messages = FirebaseFirestore.instance.collection("messages");

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection("messages").snapshots();

  TextEditingController controller = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          height: 120,
          color: Colors.purple,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: statusBarHeight, left: 20),
                  child: Text("RTChat",
                      style: GoogleFonts.rubik(
                          textStyle: const TextStyle(fontSize: 30, color: Colors.white))),
                ),
              ),
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: screenWidth / 4.5, top: 20),
                child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                                height: screenHeight / 3,
                                color: Colors.purple,
                                child: Center(
                                    child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(30),
                                      child: const Text("Are you sure you want to leave?",
                                          style: TextStyle(fontSize: 22, color: Colors.white)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      width: screenWidth / 3,
                                      height: screenHeight / 9,
                                      child: ElevatedButton(
                                          style: TextButton.styleFrom(
                                              backgroundColor: Colors.pink.shade200),
                                          onPressed: () {
                                            FirebaseAuth.instance.signOut();
                                            Navigator.pop(context);
                                          },
                                          child:
                                              const Text("Leave", style: TextStyle(fontSize: 30))),
                                    ),
                                  ],
                                )));
                          });
                    },
                    icon: const Icon(Icons.exit_to_app, size: 40, color: Colors.white)),
              ))
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (context, snapshot, {orderBy = "date"}) {
            return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Container(
                  child: Column(children: [
                Container(
                    margin: const EdgeInsets.all(20),
                    width: screenWidth - 20,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.pink.shade100, borderRadius: BorderRadius.circular(20)),
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${data["user"]} :",
                                style: const TextStyle(color: Color.fromARGB(129, 0, 0, 0))),
                            Text(data["message"],
                                style: const TextStyle(
                                  fontSize: 18,
                                )),
                          ],
                        ))),
              ]));
            }).toList());
          }),
      bottomNavigationBar: Stack(children: [
        Container(
            width: screenWidth / 1.3,
            margin: const EdgeInsets.all(20),
            child: TextField(
                maxLength: 60,
                controller: controller,
                decoration: const InputDecoration(border: OutlineInputBorder()))),
        Container(
            margin: EdgeInsets.only(left: screenWidth / 1.2, top: 20),
            child: IconButton(
                onPressed: () {
                  var now = DateTime.now();

                  if (controller.text.isNotEmpty) {
                    messages
                        .doc(now.year.toString() +
                            now.month.toString() +
                            now.day.toString() +
                            now.hour.toString() +
                            now.minute.toString() +
                            now.second.toString())
                        .set({
                      "message": controller.text,
                      "user": user.email.toString().split("@")[0]
                    });
                    controller.text = "";
                  }
                },
                icon: const Icon(Icons.send, size: 35, color: Colors.purple)))
      ]),
    );
  }
}

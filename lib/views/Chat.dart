import 'package:flutter/material.dart';

import 'Notifications.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: 'Nawal',
        imageURL: 'assets/users/person.jpg',
        messageText: 'Hiiiiii',
        time: '6:00 PM'),
    ChatUsers(
        name: 'Akram',
        imageURL: 'assets/users/person.jpg',
        messageText: 'Hiiiiii guys',
        time: '6:00 PM'),
    ChatUsers(
        name: 'Allaa',
        imageURL: 'assets/users/person.jpg',
        messageText: 'I am chating with Nawal',
        time: '6:00 PM'),
    ChatUsers(
        name: 'ali',
        imageURL: 'assets/users/person.jpg',
        messageText: 'Hiiiiii',
        time: '6:00 PM'),
    ChatUsers(
        name: 'rami',
        imageURL: 'assets/users/person.jpg',
        messageText: 'Hiiiiii',
        time: '6:00 PM'),
    ChatUsers(
        name: 'Aya',
        imageURL: 'assets/users/person.jpg',
        messageText: 'Hiiiiii',
        time: '6:00 PM'),
  ];
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8, top: 15),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 2)),
                      padding: EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/users/person.jpg"),
                        maxRadius: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Chat",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 2, right: 2, top: 2, bottom: 2),
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.pink[50],
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.purple,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 2, right: 2, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Icon(
                        Icons.mic,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Container(
          color: Colors.white,
          width: media.width,
          height: media.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: media.height * 0.15,
                  width: media.width,
                  child: ListView.builder(
                      itemCount: chatUsers.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.green, width: 2)),
                                padding: EdgeInsets.all(2),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(chatUsers[index].imageURL),
                                  maxRadius: 30,
                                ),
                              ),
                              SizedBox(
                                  width: 50,
                                  child: Text(
                                    chatUsers[index].name,
                                    style: TextStyle(fontSize: 16),
                                  )),
                            ],
                          ),
                        );
                      }),
                ),
                ListView.builder(
                  itemCount: chatUsers.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 16),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ConversationList(
                      name: chatUsers[index].name,
                      messageText: chatUsers[index].messageText,
                      imageUrl: chatUsers[index].imageURL,
                      time: chatUsers[index].time,
                      isMessageRead: (index == 0 || index == 3) ? true : false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatUsers(
      {@required this.name,
      @required this.messageText,
      @required this.imageURL,
      @required this.time});
}

class ConversationList extends StatefulWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  ConversationList(
      {@required this.name,
      @required this.messageText,
      @required this.imageUrl,
      @required this.time,
      @required this.isMessageRead});
  @override
  _ConversationListState createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Notifications()));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        color: widget.isMessageRead ? Colors.grey[100] : Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 2)),
                    padding: EdgeInsets.all(2),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(widget.imageUrl),
                      maxRadius: 30,
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.name,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.isMessageRead
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: widget.isMessageRead
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

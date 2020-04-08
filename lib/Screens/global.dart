import 'package:flutter/material.dart';

Color myGreen = Color(0xff4bb17b);
enum MessageType {sent, received}
List<Map<String, dynamic>> MessagesList = [
  {
    'username': 'Workout Squard',
    'lastMsg': 'Nick: Hey, man how is it going?',
    'seen': true,
    'hasUnSeenMsgs': true,
    'unseenCount': 2,
    'lastMsgTime': '9 min',
    'isOnline': false
  },
  {
    'username': 'Kickback & Relax',
    'lastMsg': 'Mark: Are you going to today\'s event ' ,
    'seen': true,
    'hasUnSeenMsgs': true,
    'unseenCount': 3,
    'lastMsgTime': 'Yestarday',
    'isOnline': true
  },

];

List<Map<String, dynamic>> messages = [
  {
    'status' : MessageType.received,
    'contactImgUrl' : "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg",
    'contactName' : 'Melina Buschaur',
    'message' : 'Hey @Miguel I made a group chat for tonight. Are You still down to come?' ,
    'time' : '12:23 AM'
  },
  {
    'status' : MessageType.sent,
    'sentImgUrl' : 'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg',
    'contactName' : 'Miguel Leal',
    'message' : 'Hey,yeah i cam still down for tonight, what time are you arriving?' ,
    'time' : '12:25 AM'
  },
  {
    'status' : MessageType.received,
    'contactImgUrl' : 'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg',
    'contactName' : 'jose Martinez',
    'message' : 'I will come too!' ,
    'time' : '12:27 AM'
  },

];


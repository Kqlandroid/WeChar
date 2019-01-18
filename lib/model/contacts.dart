import 'package:flutter/material.dart';

class Contacts{
  const Contacts({
   @required this.avatar,
   @required this.name,
   @required this.nameIndex
}):assert(avatar!=null),
  assert(name !=null);
  final String avatar;
  final String name;
  final String nameIndex;
}

class ContactsPageData{
  static ContactsPageData moke(){
    return ContactsPageData();
  }
  final List<Contacts> contacts =[
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/22.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/33.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/44.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/55.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/66.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/54.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/32.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/21.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/38.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/34.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/23.jpg',
        name: '文件传输助手',
        nameIndex: ''),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/62.jpg',
        name: '文件传输助手',
        nameIndex: ''),


  ];
}
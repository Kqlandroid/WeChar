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
        name: '阿里网',
        nameIndex: 'A'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/33.jpg',
        name: 'Tintin',
        nameIndex: 'T'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/44.jpg',
        name: '四方山',
        nameIndex: 'S'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/55.jpg',
        name: '比尔',
        nameIndex: 'B'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/66.jpg',
        name: '嘉城',
        nameIndex: 'J'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
        name: '逆风',
        nameIndex: 'N'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/54.jpg',
        name: '孔笙',
        nameIndex: 'K'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/32.jpg',
        name: '离散',
        nameIndex: 'L'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/21.jpg',
        name: '玉玉',
        nameIndex: 'Y'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/38.jpg',
        name: '人人',
        nameIndex: 'R'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/34.jpg',
        name: '等等',
        nameIndex: 'D'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/23.jpg',
        name: '文件传输助手',
        nameIndex: 'W'),
    const Contacts(
        avatar: 'https://randomuser.me/api/portraits/women/62.jpg',
        name: '啊啊',
        nameIndex: 'A'),


  ];
}
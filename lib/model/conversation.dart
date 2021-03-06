import 'package:flutter/material.dart';
import '../colorstants.dart' show AppColors;
enum Device{
  MAC,WIN
}
class Conversation{
  const Conversation({
    @required this.avatar,
    @required this.title,
    this.titleColor = AppColors.TextTitleColor,
    this.des,
    @required this.updateAt,
    this.isMute:false,
    this.unreadMsgNum = 0,
    this.displayDot = false,
  }):assert(avatar != null),
        assert(title != null),
        assert(updateAt != null);

  final String avatar;//头像
  final String title;//标题
  final int titleColor;//标题颜色
  final String des;//简介
  final String updateAt;//时间
  final bool isMute;//免打扰
  final int unreadMsgNum;
  final bool displayDot;

  bool IsAvatarFromNet(){
    if(this.avatar.indexOf("http")==0 || this.avatar.indexOf("https")==0){
      return true;
    }
    return false;
  }
}


//const Map<String,List<Conversation>> conversationmockData = {
//  'deviceInfo':null,
//  'conversations':mockConversations
//};
class ConversationPageData{
  const ConversationPageData({
    this.device,
    this.data
});
  final Device device;
  final List<Conversation> data;
  static moke(){
    return ConversationPageData(device: Device.MAC,data: mockConversations);
}
  static  List<Conversation> mockConversations = [
    const Conversation(
        avatar: 'assets/images/icon_file_assistant.png',
        title: '文件传输助手',
        des: '',
        updateAt: '18:56',
        unreadMsgNum: 1),
    const Conversation(
        avatar: 'assets/images/icon_tx_news.png',
        title: '腾讯新闻',
        des: '豪车与出租剐蹭，俩车主当街出手',
        updateAt: '19:33',
        unreadMsgNum: 56),
    const Conversation(
        avatar: 'assets/images/icon_game.png',
        title: '微信游戏',
        titleColor: 0xff586b95,
        des: '25元现金助力开学季',
        updateAt: '09:56',
        unreadMsgNum: 20),
    const Conversation(
        avatar: 'https://randomuser.me/api/portraits/women/29.jpg',
        title: 'LiYi',
        des: '今天要去打球么？',
        updateAt: '昨天',
        isMute: false,
        unreadMsgNum: 10),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/54.jpg',
      title: 'Tina',
      des: '你吃饭了吗',
      updateAt: '18:56',
      isMute: true,
      unreadMsgNum: 0,
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/93.jpg',
      title: 'Tom',
      des: '要去学校吗',
      updateAt: '18:56',
      isMute: true,
      unreadMsgNum: 20,),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/women/60.jpg',
      title: '张婷婷',
      des: '你还好吗',
      updateAt: '18:56',
      isMute: false,
      unreadMsgNum: 0,),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/2.jpg',
      title: 'Me',
      des: '我很好',
      updateAt: '18:56',
      isMute: false,
      unreadMsgNum: 90,),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/0.jpg',
      title: 'Jack',
      des: '我要去休息了',
      updateAt: '19:56',
      isMute: false,
      unreadMsgNum: 0,),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/4.jpg',
      title: 'Ber',
      des: '？',
      updateAt: '18:56',
      isMute: false,
      unreadMsgNum: 99,),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/42.jpg',
      title: 'GG',
      des: '高兴',
      updateAt: '18:56',
      isMute: false,
      unreadMsgNum: 0,),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/men/65.jpg',
      title: '张飞云',
      des: '这个电影好看吧',
      updateAt: '12:56',
      isMute: false,
      unreadMsgNum: 76,),
  ];
}

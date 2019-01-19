import 'package:flutter/material.dart';
import '../model/contacts.dart';
import '../colorstants.dart' ;
class _ContactsItem extends StatelessWidget {
  const _ContactsItem({
    @required this.avatar,
    @required this.title,
    this.grouptitle,
    this.onPressd
  });

  final String avatar;
  final String title;
  final String grouptitle;
  final VoidCallback onPressd;
  bool IsAvatarFromNet(){
    if(this.avatar.indexOf("http")==0 || this.avatar.indexOf("https")==0){
      return true;
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    Widget _avatarIcon;
    if(IsAvatarFromNet()){
      _avatarIcon = Image.network(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,);
    }else{
      _avatarIcon = Image.asset(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,);
    }
    //列表项主体部分
    Widget _button = Container(
      padding:  const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 16.0,right: 16.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: Constants.Dividerwith, color:  const Color(AppColors.DivderColor),))
      ),
      child: Row(
        children: <Widget>[
          _avatarIcon,
          SizedBox(width: 10.0,),
          Text(title),
        ],
      ),
    );
    Widget _itemBody;
    if(this.grouptitle!=null){
      _itemBody = Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, right:16.0, bottom: 4.0),
            color: const Color(AppColors.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Text(this.grouptitle,style: AppStyles.GroupTitleItemTextSyle ,),
          ),
          _button,
        ],
      );
    }else{
      _itemBody = _button;
    }
    return _itemBody;
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}


class _ContactsPageState extends State<ContactsPage> {
  final List<Contacts> _contacts = ContactsPageData.moke().contacts;
  final ContactsPageData data = ContactsPageData.moke();
  final List<_ContactsItem> _functionButtons = [
    _ContactsItem(
      avatar:  'assets/images/icon_new_friend.png',
      title: '新的朋友',
      onPressd: (){
        print('添加新朋友');
      },
      grouptitle: '',
    ),_ContactsItem(
      avatar:  'assets/images/icon_group_chat.png',
      title: '群聊',
      onPressd: (){
        print('添加群聊');
      },
    ),_ContactsItem(
      avatar:  'assets/images/icon_label.png',
      title: '标签',
      onPressd: (){
        print('添加标签');
      },
    ),_ContactsItem(
      avatar:  'assets/images/icon_public_address.png',
      title: '公众号',
      onPressd: (){
        print('添加公众号');
      },
    )
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contacts..addAll(data.contacts)..addAll(data.contacts)..addAll(data.contacts);
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context,int index){
        if(index<_functionButtons.length){
          return _functionButtons[index];
        }
        int _contIndex = index -_functionButtons.length;
        Contacts contacts = _contacts[_contIndex];
        return _ContactsItem(avatar: contacts.avatar,title: contacts.name,grouptitle: contacts.nameIndex);
      },itemCount: _contacts.length + _functionButtons.length,);
  }
}

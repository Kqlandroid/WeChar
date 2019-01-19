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
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding:  const EdgeInsets.symmetric(vertical: 10.0),
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
    if(this.grouptitle != null){
      _itemBody = Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, right:16.0, bottom: 4.0),
            color: const Color(AppColors.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Text(this.grouptitle,style: AppStyles.GroupTitleItemTextSyle),
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
const INDEX_BAR_WORDS = [
  "↑", "☆",
  "A", "B", "C", "D", "E", "F", "G",
  "H", "I", "J", "K", "L", "M", "N",
  "O", "P", "Q", "R", "S", "T", "U",
  "V", "W", "X", "Y", "Z"
];

class _ContactsPageState extends State<ContactsPage> {
  final List<Contacts> _contacts = [];
  final ContactsPageData data = ContactsPageData.moke();
  final List<_ContactsItem> _functionButtons = [
    _ContactsItem(
      avatar:  'assets/images/icon_new_friend.png',
      title: '新的朋友',
      grouptitle: null,
      onPressd: (){
        print('添加新朋友');
      },
    ),_ContactsItem(
      avatar:  'assets/images/icon_group_chat.png',
      title: '群聊',
      grouptitle: null,
      onPressd: (){
        print('添加群聊');
      },
    ),_ContactsItem(
      avatar:  'assets/images/icon_label.png',
      title: '标签',
      grouptitle: null,
      onPressd: (){
        print('添加标签');
      },
    ),_ContactsItem(
      avatar:  'assets/images/icon_public_address.png',
      title: '公众号',
      grouptitle: null,
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
    _contacts.sort((Contacts a,Contacts b) => a.nameIndex.compareTo(b.nameIndex));
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word){
      return Expanded(child: Text(word));
    }).toList();
    return Stack(
      children: <Widget>[
        ListView.builder(
            itemBuilder: (BuildContext context,int index){
              if(index < _functionButtons.length){
                return _functionButtons[index];
              }
              int _contIndex = index -_functionButtons.length;
              bool _isGroupTitle = true;
              Contacts _contact = _contacts[_contIndex];
              if(_contIndex >= 1 && _contact.nameIndex == _contacts[_contIndex - 1].nameIndex){
                _isGroupTitle = false;
              }
              return _ContactsItem(
                  avatar: _contact.avatar,
                  title: _contact.name,
                  grouptitle: _isGroupTitle ? _contact.nameIndex : null);
            },itemCount: _contacts.length + _functionButtons.length),
        Positioned(
          width: Constants.IndexBarWith,
          right: 0.0,
          top: 0.0,
          bottom: 0.0,
          child: Column(
            children: _letters,
          ),),
      ],
    );
  }
}

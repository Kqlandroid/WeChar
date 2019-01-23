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
  static const double MARGIN_VERTICAL = 10.0;
  static const BUTTON_HEIGHT = 48.0;
  static const GROUP_TITLE_HEIGHT = 24.0;
  bool IsAvatarFromNet(){
    if(this.avatar.indexOf("http")==0 || this.avatar.indexOf("https")==0){
      return true;
    }
    return false;
  }
  static double  _height(bool hasGroupTitle) {
    final _buttonHeight = MARGIN_VERTICAL * 2 +
        Constants.ContactAvatarSize + Constants.Dividerwith;
    if(hasGroupTitle){
      return _buttonHeight+GROUP_TITLE_HEIGHT;
    }
    return _buttonHeight;
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
      padding:  const EdgeInsets.symmetric(vertical: MARGIN_VERTICAL),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: Constants.Dividerwith, color:  const Color(AppColors.DivderColor)))
      ),
      child: Row(
        children: <Widget>[
          _avatarIcon,
          SizedBox(width: 10.0,),
          Text(title),
        ],
      ),
    );
    //分组标签
    Widget _itemBody;
    if(this.grouptitle != null){
      _itemBody = Column(
        children: <Widget>[
          Container(
            height: GROUP_TITLE_HEIGHT,
            padding: EdgeInsets.only(left: 16.0, right:16.0),
            color: const Color(AppColors.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Text(this.grouptitle,style: AppStyles.GroupTitleItemTextSyle),
          ), _button],
      );
    }else{
      _itemBody = _button;
    }
    return _itemBody;
  }
}

class ContactsPage extends StatefulWidget {
  Color _indexbrBg = Colors.transparent;
  String _currentLetter = '';
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
  ScrollController _scrollController;
  final List<Contacts> _contacts = [];
  final ContactsPageData data = ContactsPageData.moke();
  final Map _letterPosMap = {INDEX_BAR_WORDS[0]:0.0};
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
    _scrollController = new ScrollController();
    //计算用于IndexBar进行定位的关键通讯录列表项的位置
    var _totalPos = _functionButtons.length*_ContactsItem._height(false);
    for(int i= 0;i<_contacts.length;i++){
      bool _hasGroupTitle = true;
      if(i > 0 && _contacts[i].nameIndex.compareTo(_contacts[i-1].nameIndex)==0){
        _hasGroupTitle = false;
      }
      if(_hasGroupTitle){
        _letterPosMap[_contacts[i].nameIndex] = _totalPos;
      }
      _totalPos += _ContactsItem._height(_hasGroupTitle);
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();

  }
  String _getletter(BuildContext contxt,int tileHeight,Offset offset){
    RenderBox _renderBox =contxt.findRenderObject();
    var local = _renderBox.globalToLocal(offset);
    int index = (local.dy~/tileHeight).clamp(0,INDEX_BAR_WORDS.length - 1);
    print(index);
    print(local);
    return INDEX_BAR_WORDS[index];
  }
  void _jumpToIndex(String letter){
    if(_letterPosMap.isNotEmpty){
      final _pos = _letterPosMap[letter];
      if(_pos!=null){
        _scrollController.animateTo(_pos,
            duration: Duration(milliseconds: 200), curve: Curves.easeIn);
      }
    }
  }
  Widget _buildIndexbar(BuildContext context,BoxConstraints constrains){
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word){
      return Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
            child: Text(word),
          ));
    }).toList();
    final _totalHeight = constrains.biggest.height;
    print(_totalHeight);
    final tileHeight = _totalHeight ~/_letters.length;
    print(tileHeight);
    return GestureDetector(
      onVerticalDragDown: (DragDownDetails details){
        print('onVerticalDragDown');
        setState(() {
          widget._indexbrBg = Colors.black26;
          widget._currentLetter = _getletter(context,tileHeight,details.globalPosition);
          _jumpToIndex(widget._currentLetter);
        });

      },
      onVerticalDragEnd: (DragEndDetails details){
        print('onVerticalDragDown');
        setState(() {
          widget._indexbrBg = Colors.transparent;
          widget._currentLetter = null;
        });
      },

      onVerticalDragCancel: (){
        print('onVerticalDragCancel xxxx');
        setState(() {
          widget._indexbrBg = Colors.transparent;
          widget._currentLetter = null;
        });
      },
      onHorizontalDragUpdate: (DragUpdateDetails details){
        setState(() {
          widget._currentLetter = _getletter(context,tileHeight,details.globalPosition);
          _jumpToIndex(widget._currentLetter);
        });
      },
      child: Column(
        children: _letters,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> _body=[
      ListView.builder(
          controller: _scrollController,
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
            return  _ContactsItem(
              avatar: _contact.avatar,
              title: _contact.name,
              grouptitle: _isGroupTitle?_contact.nameIndex:null,
            );
          },
          itemCount: _contacts.length + _functionButtons.length),

      Positioned(
        width: Constants.IndexBarWith,
        right: 0.0,
        top: 0.0,
        bottom: 0.0,
        child: Container(
          color: widget._indexbrBg,
          child: LayoutBuilder(
            builder: _buildIndexbar,
          ),
        ),
      ),
    ];
    if(widget._currentLetter != null && widget._currentLetter.isNotEmpty){
      _body.add(
        Center(
          child: Container(
            width: Constants.IndexLetterBoxSize,
            height: Constants.IndexLetterBoxSize,
            decoration:
            BoxDecoration(
              color: AppColors.IndexletterBoxBg,
              borderRadius: BorderRadius.all(Radius.circular(Constants.IndexLetterBoxRadius)),

            ),
            child: Center(
              child: Text(widget._currentLetter,style: AppStyles.IndexletterBoxTextStyle,),
            ),
          ),
        ),
      );
    }
    return Stack(
      children: _body,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_untitle2/colorstants.dart';
enum ActionItems{
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
  HELP
}
class NavigationIconView{
  final BottomNavigationBarItem item;
  NavigationIconView({Key key,String title,IconData icon,IconData activeIcon }):
        item = BottomNavigationBarItem(
            icon: Icon(icon),
            activeIcon: Icon(activeIcon),
            title: Text(title),
            backgroundColor: Colors.white
        );

}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationIconViews;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationIconViews = [
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe620,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon:IconData(
          0xe61c,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe6c2,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon:IconData(
          0xe604,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe63e,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon:IconData(
          0xe746,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '我',
        icon: IconData(
          0xe758,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon:IconData(
          0xe67d,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
    ];
  }
  _buildPopupMunuItem(int iconName,String title){
    return Row(
      children: <Widget>[
        Icon(IconData(
            iconName,
            fontFamily: Constants.IconFontFamily
        ),size: 22.0,color: const Color(AppColors.AppBarPopupMenuColor)),
        Container(width: 12.0,),
        Text(title,style: TextStyle(color: const Color(AppColors.AppBarPopupMenuColor))),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationIconViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          _currentIndex = index;
        });
        index=index+1;
        print('点击的是第$_currentIndex个Tab');
        Fluttertoast.showToast(
            msg: '点击的是第$index个Tab',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white);
      },);
    return new Scaffold(
      appBar: new  AppBar(
        title: Text('微信'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon:Icon(IconData(
                0xe600,
                fontFamily: Constants.IconFontFamily
            ),size: 22.0),
            onPressed: (){
              Fluttertoast.showToast(
                  msg: '点击的是搜索框',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white);
            },),
          Container(width: 16.0,),
          PopupMenuButton(
            itemBuilder: (BuildContext context){
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe69e, "发起群聊"),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe624, "添加朋友"),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe66d, "扫一扫"),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe62a, "收付款"),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe647, "帮助与反馈"),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(IconData(
                0xea3b,
                fontFamily: Constants.IconFontFamily
            ),size: 22.0),
          ),
          Container(width: 16.0,),
        ],
      ),
      body: new Container(
        color: Colors.white,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}

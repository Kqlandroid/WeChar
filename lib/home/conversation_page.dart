
import 'package:flutter/material.dart';
import 'package:flutter_untitle2/model/conversation.dart' show Conversation,mockConversations;
import '../colorstants.dart' show AppColors, AppStyles,Constants;

class _ConversationItem extends StatelessWidget {
  const _ConversationItem({Key key,this.conversation}):assert(conversation != null),
        super(key: key);
  final Conversation conversation;
  @override
  Widget build(BuildContext context) {
    //显示网络图片和本地图片（根据http和https进行判断）
    Widget avatar;
    if(conversation.IsAvatarFromNet()){
      avatar=Image.network(conversation.avatar,
        width: Constants.ConstConversationAvatarSize,
        height: Constants.ConstConversationAvatarSize,);
    }else{
      avatar = Image.asset(conversation.avatar,
        width: Constants.ConstConversationAvatarSize,
        height: Constants.ConstConversationAvatarSize,);
    }
    Widget avatarContainer;
    if(conversation.unreadMsgNum>0){
      //未读信息角标
      Widget unreadMsgConutText = Container(
        width: Constants.UnReadMsgNotifyDotSize,
        height: Constants.UnReadMsgNotifyDotSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular (Constants.UnReadMsgNotifyDotSize / 2.0),
          color: Color(AppColors.NotifyDotBg),
        ),
        child: Text(conversation.unreadMsgNum.toString(),style: AppStyles.UnreadMsgCountDotStyle),
      );
       avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
              right: -6.0,
              top: -6.0,
              child:unreadMsgConutText ),
        ],
      );
    }else{
      avatarContainer = avatar;
    }
//勿扰模式图标
    var _rightArea = <Widget>[
      Text(conversation.updateAt,style: AppStyles.DesStyle),
      SizedBox(height: 10.0,),
      Container(
        height: 10.0,
      )
    ];
    if(conversation.isMute){
      _rightArea.add(Icon(
        IconData(
            0xe636,
            fontFamily: Constants.IconFontFamily
        ),
        color: Color(AppColors.ConversationMutItemColor),
        size: Constants.ConversationMutIconSize,
      ));
    }else{
      _rightArea.add(Icon(
        IconData(
            0xe636,
            fontFamily: Constants.IconFontFamily
        ),
        color: Colors.transparent,
        size: Constants.ConversationMutIconSize,
      ));
    }
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Color(AppColors.ConversationItemBg),
          border: Border(
              bottom: BorderSide(
                color: Color(AppColors.DivderColor),
                width: Constants.Dividerwith,
              )
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          avatarContainer,
          Container(width: 10.0),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(conversation.title,style: AppStyles.TitleStyle),
                  Container(
                    height: 5.0,
                  ),
                  Text(conversation.des,style: AppStyles.DesStyle),
                ],
              )
          ),
          Column(
            children: _rightArea,
          ),
        ],
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext contxt,int index){
        return _ConversationItem(conversation:mockConversations[index]);
      },
      itemCount: mockConversations.length,);
  }
}

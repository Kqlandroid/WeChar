
import 'package:flutter/material.dart';
import 'package:flutter_untitle2/model/conversation.dart' show Conversation,mockConversations;
import '../colorstants.dart' show AppColors, AppStyles,Constants;

class _ConversationItem extends StatelessWidget {
  const _ConversationItem({Key key,this.conversation}):assert(conversation != null),
        super(key: key);
  final Conversation conversation;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
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
          Image.network(
            conversation.avatar,
            width: Constants.ConstConversationAvatarSize,
            height: Constants.ConstConversationAvatarSize,
          ),
          Container(width: 10.0),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(conversation.title,style: AppStyles.TitleStyle),
                  Text(conversation.des,style: AppStyles.DesStyle),
                ],
              )
          ),
          Column(
            children: <Widget>[
              Text(conversation.updateAt,style: AppStyles.DesStyle),
            ],
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

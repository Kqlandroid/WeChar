import 'package:flutter/material.dart';
import '../model/contacts.dart';
import '../colorstants.dart';
class _ContactsItem extends StatelessWidget {
  const _ContactsItem({
    @required this.avatar,
    @required this.title,
    this.grouptitle
  });

  final String avatar;
  final String title;
  final String grouptitle;
  @override
  Widget build(BuildContext context) {
    Widget _avatarIcon = Image.network(
      avatar,
      width: Constants.ContactAvatarSize,
      height: Constants.ContactAvatarSize,);
    return Container(
      padding: EdgeInsets.only(
          left: 16.0,
          top: 0.0,
          right:16.0,
          bottom: 0.0),

      child: Container(
        padding:  const EdgeInsets.only(top: 10.0,bottom: 10.0),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  width: Constants.Dividerwith,
                  color:  const Color(AppColors.DivderColor),
                )
            )
        ),
        child: Row(
          children: <Widget>[
            _avatarIcon,
            SizedBox(
              width: 10.0,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<Contacts> _contacts = ContactsPageData.moke().contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context,int index){
        Contacts contacts = _contacts[index];
        return _ContactsItem(avatar: contacts.avatar,title: contacts.name,);
      },itemCount: _contacts.length,);
  }
}

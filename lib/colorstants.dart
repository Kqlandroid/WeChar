import 'package:flutter/material.dart';
class AppColors{
  static const AppBarColor = 0xff303030;
  static const TabIconNormal = 0xff999999;
  static const TabIconActive = 0xff46c11b;
  static const AppBarPopupMenuColor = 0xffffffff;
  static const TextTitleColor= 0xff353535;
  static const ConversationItemBg = 0xffffffff;
  static const DesTextColor = 0xff9e9e9e;
  static const DivderColor = 0xffd9d9d9;
  static const NotifyDotBg = 0xffFD3B30;
  static const NotifyDotText = 0xffffffff;
  static const ConversationMutItemColor = 0xffd8d8d8;
  static const DeviceInfoItemBg = 0xfff5f5f5;
  static const DevceInfoItemText = 0xff606062;
  static const DeviceInfoItemIcon = 0xff606062;
}
class AppStyles{
  static const TitleStyle = TextStyle(
      fontSize: 14.0,
      color: Color(AppColors.TextTitleColor)
  );
  static const DesStyle = TextStyle(
      fontSize: 12.0,
      color: Color(AppColors.DesTextColor)
  );
  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.NotifyDotText),
  );
  static const DeviceInfoItemTextStyle = TextStyle(
    fontSize: 13.0,
    color: Color(AppColors.DevceInfoItemText),
  );
}
class Constants{
  static const IconFontFamily = "appIconFont";
  static const ConstConversationAvatarSize = 48.0;
  static const Dividerwith = 1.0;
  static const UnReadMsgNotifyDotSize = 20.0;
  static const ConversationMutIconSize = 18.0;
//  static const DeviceInfoItemHeight = 32.0;
  static const ContactAvatarSize = 36.0;
}
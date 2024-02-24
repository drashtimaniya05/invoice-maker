import 'package:shared_preferences/shared_preferences.dart';

class PreferencesKey {
  static late SharedPreferences instance;

  static const String isLogin = "IS_LOGIN";
  static const String isDark = "IS_DARK";
  static const String isImage = "IS_IMAGE";

  static const String uID = "UID";
  static const String isUserName = "IS_USERNAME";
  static const String isEmail = "IS_Email";
  static const String isPassword = "IS_PASSWORD";
  static const String isMobileNum = "IS_MOBILENUM";

  static const String isInumber = "IS_INUMBER";
  static const String isCdate = "IS_CDATE";
  static const String isDdate = "IS_DDate";
  static const String isItitle = "IS_ITITLE";

  static const String isBlogo = "IS_BLOGO";
  static const String isBname = "IS_BNAME";
  static const String isEadd = "IS_EADD";
  static const String isBphone = "IS_BPHONE";
  static const String isBaddr = "Is_BADDR";

  static const String isCname = "IS_CNAME";
  static const String isCeadd = "IS_CEDD";
  static const String isCphone = "IS_CPHONE";
  static const String isBillad = "IS_BILLAD";
  static const String isSaddr = "IS_SADDR";

  static const String isIname = "IS_INAME";
  static const String isIprice = "IS_IPRICE";
  static const String isIquantity = "IS_IQUANTITY";

  static const String isSign = "IS_SIGN";
}

// ignore_for_file: non_constant_identifier_names

import 'package:invoicemaker/utils/app_preference/preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static final AppPreference _appPreference = AppPreference._internal();
  factory AppPreference() {
    return _appPreference;
  }

  AppPreference._internal();
  SharedPreferences? preferences;
  Future<void> initialiAppPreferenc() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future ClearSharedPrefernces() async {
    await preferences?.clear();
  }

  bool isLogin() {
    return (preferences?.getBool(PreferencesKey.isLogin)) ?? false;
  }

  Future setIsLogin(bool isLogin) async {
    return (preferences?.setBool(PreferencesKey.isLogin, isLogin));
  }

  String getEmail() {
    return (preferences?.getString(PreferencesKey.isEmail)) ?? '';
  }

  Future setEmail(String isEmail) async {
    return (preferences?.setString(PreferencesKey.isEmail, isEmail));
  }

  String getPassword() {
    return (preferences?.getString(PreferencesKey.isPassword)) ?? '';
  }

  Future setPassword(String isPassword) async {
    return (preferences?.setString(PreferencesKey.isPassword, isPassword));
  }

  bool getTheme() {
    return (preferences?.getBool(PreferencesKey.isDark)) ?? true;
  }

  Future setTheme(bool isDark) async {
    return (preferences?.setBool(PreferencesKey.isDark, isDark));
  }

  String getImage() {
    return (preferences?.getString(PreferencesKey.isImage)) ?? '';
  }

  Future setImage(String isImage) async {
    return (preferences?.setString(PreferencesKey.isImage, isImage));
  }

  //invoice info
  int getInumber() {
    return (preferences?.getInt(PreferencesKey.isInumber)) ?? 0;
  }

  Future setInumber(int isInumber) async {
    return (preferences?.setInt(PreferencesKey.isInumber, isInumber));
  }

  int getCdate() {
    return (preferences?.getInt(PreferencesKey.isCdate)) ?? 0;
  }

  Future setCdate(int isCdate) async {
    return (preferences?.setInt(PreferencesKey.isCdate, isCdate));
  }

  int getDdate() {
    return (preferences?.getInt(PreferencesKey.isDdate)) ?? 0;
  }

  Future setDdate(int isDdate) async {
    return (preferences?.setInt(PreferencesKey.isDdate, isDdate));
  }

  String getItitle() {
    return (preferences?.getString(PreferencesKey.isItitle)) ?? "";
  }

  Future setItitle(String isItitle) async {
    return (preferences?.setString(PreferencesKey.isItitle, isItitle));
  }

  //Business info
  String getBlogo() {
    return (preferences?.getString(PreferencesKey.isBlogo)) ?? "";
  }

  Future setBlogo(String isBlogo) async {
    return (preferences?.setString(PreferencesKey.isBlogo, isBlogo));
  }

  String getBname() {
    return (preferences?.getString(PreferencesKey.isBname)) ?? "";
  }

  Future setBname(String isBname) async {
    return (preferences?.setString(PreferencesKey.isBname, isBname));
  }

  String getEadd() {
    return (preferences?.getString(PreferencesKey.isEadd)) ?? "";
  }

  Future setEadd(String isEadd) async {
    return (preferences?.setString(PreferencesKey.isEadd, isEadd));
  }

  String getBphone() {
    return (preferences?.getString(PreferencesKey.isBphone)) ?? "";
  }

  Future setBphone(String isBphone) async {
    return (preferences?.setString(PreferencesKey.isBphone, isBphone));
  }

  String getBaddr() {
    return (preferences?.getString(PreferencesKey.isBaddr)) ?? "";
  }

  Future setBaddr(String isBaddr) async {
    return (preferences?.setString(PreferencesKey.isBaddr, isBaddr));
  }

  //client info
  String getCname() {
    return (preferences?.getString(PreferencesKey.isCname)) ?? "";
  }

  Future setCname(String isCname) async {
    return (preferences?.setString(PreferencesKey.isCname, isCname));
  }

  String getCeadd() {
    return (preferences?.getString(PreferencesKey.isCeadd)) ?? "";
  }

  Future setCeadd(String isCeadd) async {
    return (preferences?.setString(PreferencesKey.isCeadd, isCeadd));
  }

  String getCphone() {
    return (preferences?.getString(PreferencesKey.isCphone)) ?? "";
  }

  Future setCphone(String isCphone) async {
    return (preferences?.setString(PreferencesKey.isCphone, isCphone));
  }

  String getBilladd() {
    return (preferences?.getString(PreferencesKey.isBillad)) ?? "";
  }

  Future setBilladd(String isBilladd) async {
    return (preferences?.setString(PreferencesKey.isBillad, isBilladd));
  }

  String getSaddr() {
    return (preferences?.getString(PreferencesKey.isSaddr)) ?? "";
  }

  Future setSaddr(String isSaddr) async {
    return (preferences?.setString(PreferencesKey.isSaddr, isSaddr));
  }

  //add item

  String getIname() {
    return (preferences?.getString(PreferencesKey.isIname)) ?? "";
  }

  Future setIname(String isIname) async {
    return (preferences?.setString(PreferencesKey.isIname, isIname));
  }

  String getIprice() {
    return (preferences?.getString(PreferencesKey.isIprice)) ?? "";
  }

  Future setIprice(String isIprice) async {
    return (preferences?.setString(PreferencesKey.isIprice, isIprice));
  }
}

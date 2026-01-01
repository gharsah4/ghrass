// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Gheras`
  String get title {
    return Intl.message('Gheras', name: 'title', desc: '', args: []);
  }

  /// `WELCOME`
  String get welcome {
    return Intl.message('WELCOME', name: 'welcome', desc: '', args: []);
  }

  /// `The best of the land delivered to your door`
  String get theBest {
    return Intl.message(
      'The best of the land delivered to your door',
      name: 'theBest',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get SignUp {
    return Intl.message('Sign up', name: 'SignUp', desc: '', args: []);
  }

  /// `Log in`
  String get LogIn {
    return Intl.message('Log in', name: 'LogIn', desc: '', args: []);
  }

  /// `Log out`
  String get LogOut {
    return Intl.message('Log out', name: 'LogOut', desc: '', args: []);
  }

  /// `Create your new account`
  String get create {
    return Intl.message(
      'Create your new account',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message('Name', name: 'Name', desc: '', args: []);
  }

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `Phone number`
  String get PhoneNumber {
    return Intl.message(
      'Phone number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password `
  String get Password {
    return Intl.message('Password ', name: 'Password', desc: '', args: []);
  }

  /// `I agree to the Terms & Conditions and Privacy Policy `
  String get Terms {
    return Intl.message(
      'I agree to the Terms & Conditions and Privacy Policy ',
      name: 'Terms',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get already {
    return Intl.message(
      'Already have an account? ',
      name: 'already',
      desc: '',
      args: [],
    );
  }

  /// `   Or Continue With   `
  String get continuee {
    return Intl.message(
      '   Or Continue With   ',
      name: 'continuee',
      desc: '',
      args: [],
    );
  }

  /// `Log in to your account`
  String get LogInTo {
    return Intl.message(
      'Log in to your account',
      name: 'LogInTo',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get Remember {
    return Intl.message('Remember me', name: 'Remember', desc: '', args: []);
  }

  /// `Forget Password?`
  String get Forget {
    return Intl.message('Forget Password?', name: 'Forget', desc: '', args: []);
  }

  /// `Create new account? `
  String get CreateN {
    return Intl.message(
      'Create new account? ',
      name: 'CreateN',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterName {
    return Intl.message(
      'Enter your name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email`
  String get enterEmail {
    return Intl.message(
      'Enter your Email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Give this location a name`
  String get locationName {
    return Intl.message(
      'Give this location a name',
      name: 'locationName',
      desc: '',
      args: [],
    );
  }

  /// `(e.g. Home, Family House)`
  String get egLocation {
    return Intl.message(
      '(e.g. Home, Family House)',
      name: 'egLocation',
      desc: '',
      args: [],
    );
  }

  /// `Delivery location`
  String get deliveryLocation {
    return Intl.message(
      'Delivery location',
      name: 'deliveryLocation',
      desc: '',
      args: [],
    );
  }

  /// `Jizan`
  String get Jizan {
    return Intl.message('Jizan', name: 'Jizan', desc: '', args: []);
  }

  /// `Street, Prince Mohammad Bin Nasser Rd, Ash Shati, \nJazan Chamber of Commerce, Jazan`
  String get locationDetail {
    return Intl.message(
      'Street, Prince Mohammad Bin Nasser Rd, Ash Shati, \nJazan Chamber of Commerce, Jazan',
      name: 'locationDetail',
      desc: '',
      args: [],
    );
  }

  /// `Confirm location`
  String get confirmL {
    return Intl.message(
      'Confirm location',
      name: 'confirmL',
      desc: '',
      args: [],
    );
  }

  /// `Location saved successfully`
  String get locationSaved {
    return Intl.message(
      'Location saved successfully',
      name: 'locationSaved',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Offers`
  String get offers {
    return Intl.message('Offers', name: 'offers', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Discounts`
  String get discounts {
    return Intl.message('Discounts', name: 'discounts', desc: '', args: []);
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Mango`
  String get mango {
    return Intl.message('Mango', name: 'mango', desc: '', args: []);
  }

  /// `Kiwi`
  String get kiwi {
    return Intl.message('Kiwi', name: 'kiwi', desc: '', args: []);
  }

  /// `Red Apple`
  String get redApple {
    return Intl.message('Red Apple', name: 'redApple', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Vegetables`
  String get vegetables {
    return Intl.message('Vegetables', name: 'vegetables', desc: '', args: []);
  }

  /// `Fruits`
  String get fruits {
    return Intl.message('Fruits', name: 'fruits', desc: '', args: []);
  }

  /// `Seasonal`
  String get seasonal {
    return Intl.message('Seasonal', name: 'seasonal', desc: '', args: []);
  }

  /// `New Arrivals`
  String get newArrivals {
    return Intl.message(
      'New Arrivals',
      name: 'newArrivals',
      desc: '',
      args: [],
    );
  }

  /// `Strawberry`
  String get strawberry {
    return Intl.message('Strawberry', name: 'strawberry', desc: '', args: []);
  }

  /// `Pomegranate`
  String get pomegranate {
    return Intl.message('Pomegranate', name: 'pomegranate', desc: '', args: []);
  }

  /// `Asparagus`
  String get asparagus {
    return Intl.message('Asparagus', name: 'asparagus', desc: '', args: []);
  }

  /// `Fresh\nVegetables`
  String get freshV {
    return Intl.message(
      'Fresh\nVegetables',
      name: 'freshV',
      desc: '',
      args: [],
    );
  }

  /// `Fresh\nFruits`
  String get freshF {
    return Intl.message('Fresh\nFruits', name: 'freshF', desc: '', args: []);
  }

  /// `Tomato`
  String get tomato {
    return Intl.message('Tomato', name: 'tomato', desc: '', args: []);
  }

  /// `Potato`
  String get potato {
    return Intl.message('Potato', name: 'potato', desc: '', args: []);
  }

  /// `Carrot`
  String get carrot {
    return Intl.message('Carrot', name: 'carrot', desc: '', args: []);
  }

  /// `Cucumber`
  String get cucumber {
    return Intl.message('Cucumber', name: 'cucumber', desc: '', args: []);
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message('Add to cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Local`
  String get locall {
    return Intl.message('Local', name: 'locall', desc: '', args: []);
  }

  /// `Organic`
  String get organic {
    return Intl.message('Organic', name: 'organic', desc: '', args: []);
  }

  /// `Kilo`
  String get kilo {
    return Intl.message('Kilo', name: 'kilo', desc: '', args: []);
  }

  /// `Total:`
  String get total {
    return Intl.message('Total:', name: 'total', desc: '', args: []);
  }

  /// `Your cart`
  String get cart {
    return Intl.message('Your cart', name: 'cart', desc: '', args: []);
  }

  /// `The cart is empty`
  String get cartEmpty {
    return Intl.message(
      'The cart is empty',
      name: 'cartEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Select address `
  String get selectAddress {
    return Intl.message(
      'Select address ',
      name: 'selectAddress',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get homeAddress {
    return Intl.message('home', name: 'homeAddress', desc: '', args: []);
  }

  /// `work`
  String get workAddress {
    return Intl.message('work', name: 'workAddress', desc: '', args: []);
  }

  /// `Select time `
  String get selectTime {
    return Intl.message('Select time ', name: 'selectTime', desc: '', args: []);
  }

  /// `Select payment method`
  String get selectPayment {
    return Intl.message(
      'Select payment method',
      name: 'selectPayment',
      desc: '',
      args: [],
    );
  }

  /// `Voucher code`
  String get voucherCode {
    return Intl.message(
      'Voucher code',
      name: 'voucherCode',
      desc: '',
      args: [],
    );
  }

  /// `Cart total`
  String get cartTotal {
    return Intl.message('Cart total', name: 'cartTotal', desc: '', args: []);
  }

  /// `Delivery fees `
  String get deliveryFees {
    return Intl.message(
      'Delivery fees ',
      name: 'deliveryFees',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message('Pay', name: 'pay', desc: '', args: []);
  }

  /// `Thank you for your order!`
  String get TyMessage {
    return Intl.message(
      'Thank you for your order!',
      name: 'TyMessage',
      desc: '',
      args: [],
    );
  }

  /// `      Your payment was successful\nWe’re picking the freshest for you 🌱 💚`
  String get paymentMessage {
    return Intl.message(
      '      Your payment was successful\nWe’re picking the freshest for you 🌱 💚',
      name: 'paymentMessage',
      desc: '',
      args: [],
    );
  }

  /// `Order number:`
  String get orderNumber {
    return Intl.message(
      'Order number:',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Track order`
  String get trackOrder {
    return Intl.message('Track order', name: 'trackOrder', desc: '', args: []);
  }

  /// `Back to home`
  String get backToHome {
    return Intl.message('Back to home', name: 'backToHome', desc: '', args: []);
  }

  /// `Previous orders`
  String get previousO {
    return Intl.message(
      'Previous orders',
      name: 'previousO',
      desc: '',
      args: [],
    );
  }

  /// `Current orders`
  String get currentO {
    return Intl.message('Current orders', name: 'currentO', desc: '', args: []);
  }

  /// `No orders found`
  String get noOrders {
    return Intl.message(
      'No orders found',
      name: 'noOrders',
      desc: '',
      args: [],
    );
  }

  /// `Track`
  String get track {
    return Intl.message('Track', name: 'track', desc: '', args: []);
  }

  /// `Reorder`
  String get reorder {
    return Intl.message('Reorder', name: 'reorder', desc: '', args: []);
  }

  /// `favorites`
  String get favorites {
    return Intl.message('favorites', name: 'favorites', desc: '', args: []);
  }

  /// `No favorite products yet`
  String get noFavorites {
    return Intl.message(
      'No favorite products yet',
      name: 'noFavorites',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get searchResult {
    return Intl.message(
      'No results found',
      name: 'searchResult',
      desc: '',
      args: [],
    );
  }

  /// `Invite friend`
  String get inviteFriend {
    return Intl.message(
      'Invite friend',
      name: 'inviteFriend',
      desc: '',
      args: [],
    );
  }

  /// `My profile`
  String get myProfile {
    return Intl.message('My profile', name: 'myProfile', desc: '', args: []);
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Customer service`
  String get customerService {
    return Intl.message(
      'Customer service',
      name: 'customerService',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Enable notification`
  String get notification {
    return Intl.message(
      'Enable notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change location`
  String get changeLocation {
    return Intl.message(
      'Change location',
      name: 'changeLocation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get ausLogout {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'ausLogout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Enter your information`
  String get information {
    return Intl.message(
      'Enter your information',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Name in card`
  String get nameInCard {
    return Intl.message('Name in card', name: 'nameInCard', desc: '', args: []);
  }

  /// `Card number`
  String get cardNumber {
    return Intl.message('Card number', name: 'cardNumber', desc: '', args: []);
  }

  /// `Expiry date`
  String get expiryDate {
    return Intl.message('Expiry date', name: 'expiryDate', desc: '', args: []);
  }

  /// `Security code`
  String get securityCode {
    return Intl.message(
      'Security code',
      name: 'securityCode',
      desc: '',
      args: [],
    );
  }

  /// `Save card for future payment`
  String get saveCard {
    return Intl.message(
      'Save card for future payment',
      name: 'saveCard',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmP {
    return Intl.message('Confirm', name: 'confirmP', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

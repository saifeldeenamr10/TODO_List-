/// A class that contains all the asset paths used in the application.
/// Assets are organized by their type and purpose.
class AppAssets {
  // Private constructor to prevent instantiation
  AppAssets._();

  /// Base paths for different asset types
  static const String _imagesPath = 'assets/images';
  static const String _iconsPath = 'assets/icons';
  static const String _fontsPath = 'assets/fonts';

  /// Image assets
  static const String palestineFlag = '$_imagesPath/palestine_flag.jpg';

  /// Icon assets
  static const String page1 = '$_iconsPath/page1.svg';
  static const String page2 = '$_iconsPath/page2.svg';
  static const String page5 = '$_iconsPath/page5.svg';
  static const String profileIcon = '$_iconsPath/Profile - Iconly Pro.svg';
  static const String lockIcon = '$_iconsPath/Lock - Iconly Pro.svg';
  static const String settingIcon = '$_iconsPath/Setting - Iconly Pro.svg';

  /// Font assets
  static const String lexendDecaThin = '$_fontsPath/LexendDeca-Thin.ttf';
  static const String lexendDecaExtraLight =
      '$_fontsPath/LexendDeca-ExtraLight.ttf';
  static const String lexendDecaLight = '$_fontsPath/LexendDeca-Light.ttf';
  static const String lexendDecaRegular = '$_fontsPath/LexendDeca-Regular.ttf';
  static const String lexendDecaMedium = '$_fontsPath/LexendDeca-Medium.ttf';
  static const String lexendDecaSemiBold =
      '$_fontsPath/LexendDeca-SemiBold.ttf';
  static const String lexendDecaBold = '$_fontsPath/LexendDeca-Bold.ttf';
  static const String lexendDecaExtraBold =
      '$_fontsPath/LexendDeca-ExtraBold.ttf';
  static const String lexendDecaBlack = '$_fontsPath/LexendDeca-Black.ttf';
}

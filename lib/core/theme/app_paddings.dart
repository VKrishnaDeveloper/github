import 'package:my_hub_user/core/utils/app_dimension.dart';
import 'package:my_hub_user/core/utils/size_utils.dart';

class AppPaddings {
  static final none = getPadding(all: DIMENSION_0);
  static final xxs = getPadding(all: DIMENSION_2);
  static final xs = getPadding(all: DIMENSION_4);
  static final small = getPadding(all: DIMENSION_8);
  static final regular = getPadding(all: DIMENSION_16);
  static final large = getPadding(all: DIMENSION_24);
  static final extraLarge = getPadding(all: DIMENSION_32);
  static final xxl = getPadding(all: DIMENSION_40);
}

class AppVerticalAndHorizontalPadding {
  static final xxs =
      getSymmetricPadding(horizontal: DIMENSION_2, vertical: DIMENSION_2);
  static final xs =
      getSymmetricPadding(horizontal: DIMENSION_4, vertical: DIMENSION_4);
  static final small =
      getSymmetricPadding(horizontal: DIMENSION_10, vertical: DIMENSION_8);
  static final horizontalRegularVerticalXS =
      getSymmetricPadding(horizontal: DIMENSION_16, vertical: DIMENSION_4);
  static final horizontalRegularVerticalSmall =
      getSymmetricPadding(horizontal: DIMENSION_14, vertical: DIMENSION_8);
  static final horizontalSmallVerticalRegular =
      getSymmetricPadding(horizontal: DIMENSION_8, vertical: DIMENSION_16);
  static final regular =
      getSymmetricPadding(horizontal: DIMENSION_16, vertical: DIMENSION_16);
  static final large =
      getSymmetricPadding(horizontal: DIMENSION_24, vertical: DIMENSION_24);
  static final extraLarge =
      getSymmetricPadding(horizontal: DIMENSION_32, vertical: DIMENSION_32);
  static final horizontalExtraLargeVerticalRegular =
      getSymmetricPadding(horizontal: DIMENSION_32, vertical: DIMENSION_16);
  static final horizontalExtraLargeVerticalSmall =
      getSymmetricPadding(horizontal: DIMENSION_32, vertical: DIMENSION_8);
  static final xxl =
      getSymmetricPadding(horizontal: DIMENSION_40, vertical: DIMENSION_40);
}

class AppHorizontalPaddings {
  static final xxs = getSymmetricPadding(horizontal: DIMENSION_2);
  static final xs = getSymmetricPadding(horizontal: DIMENSION_4);
  static final small = getSymmetricPadding(horizontal: DIMENSION_8);
  static final regular = getSymmetricPadding(horizontal: DIMENSION_16);
  static final large = getSymmetricPadding(horizontal: DIMENSION_24);
  static final extraLarge = getSymmetricPadding(horizontal: DIMENSION_32);
  static final xxl = getSymmetricPadding(horizontal: DIMENSION_40);
  static final xl = getSymmetricPadding(horizontal: DIMENSION_20);
}

class AppVerticalPaddings {
  static final xxs = getSymmetricPadding(vertical: DIMENSION_2);
  static final xs = getSymmetricPadding(vertical: DIMENSION_4);
  static final small = getSymmetricPadding(vertical: DIMENSION_8);
  static final regular = getSymmetricPadding(vertical: DIMENSION_16);
  static final large = getSymmetricPadding(vertical: DIMENSION_24);
  static final extraLarge = getSymmetricPadding(vertical: DIMENSION_32);
  static final xxl = getSymmetricPadding(vertical: DIMENSION_40);
}

class AppLeftPaddings {
  static final xs = getPadding(left: DIMENSION_4);
  static final small = getPadding(left: DIMENSION_8);
  static final regular = getPadding(left: DIMENSION_16);
  static final large = getPadding(left: DIMENSION_24);
  static final xl = getPadding(left: DIMENSION_30);
  static final xxl = getPadding(all: DIMENSION_42);
}

class AppTopPaddings {
  static final xxs = getPadding(top: DIMENSION_2);
  static final xs = getPadding(top: DIMENSION_4);
  static final small = getPadding(top: DIMENSION_8);
  static final regular = getPadding(top: DIMENSION_16);
  static final large = getPadding(top: DIMENSION_24);
  static final extraLarge = getPadding(top: DIMENSION_30);
}

class AppRightPaddings {
  static final xs = getPadding(right: DIMENSION_4);
  static final small = getPadding(right: DIMENSION_8);
  static final regular = getPadding(right: DIMENSION_16);
  static final large = getPadding(bottom: DIMENSION_24);
}

class AppBottomPaddings {
  static final xs = getPadding(bottom: DIMENSION_4);
  static final small = getPadding(bottom: DIMENSION_8);
  static final regular = getPadding(bottom: DIMENSION_16);
  static final large = getPadding(bottom: DIMENSION_24);
}

class AppCustomPaddings {
  ///  Dashboard home screen
  static final homeCardPadding = getPadding(
    top: DIMENSION_32,
    left: DIMENSION_8,
    right: DIMENSION_8,
    bottom: DIMENSION_8,
  );

  static final cashBackInfoPadding = getPadding(
    top: DIMENSION_32,
    left: DIMENSION_16,
    right: DIMENSION_16,
    bottom: DIMENSION_16,
  );

  static final titleBarForgotPassword = getPadding(
    top: DIMENSION_24,
    left: DIMENSION_8,
    right: DIMENSION_8,
    bottom: DIMENSION_8,
  );
  static final diverPadding = getSymmetricPadding(
    horizontal: getHorizontalSize(DIMENSION_16),
    vertical: getVerticalSize(DIMENSION_4),
  );
  static final enrollEarnCashBackPurchasesPadding = getPadding(
    top: DIMENSION_24,
    left: DIMENSION_16,
    right: DIMENSION_16,
    bottom: DIMENSION_16,
  );
  static final cashBackListPadding = getPadding(
    top: DIMENSION_16,
    left: DIMENSION_32,
    right: DIMENSION_32,
    bottom: DIMENSION_16,
  );

  static final horizontalAndTopPadding = getPadding(
    top: DIMENSION_16,
    left: DIMENSION_16,
    right: DIMENSION_16,
    bottom: DIMENSION_0,
  );
  static final horizontalAndBottomPadding = getPadding(
    top: DIMENSION_0,
    left: DIMENSION_16,
    right: DIMENSION_16,
    bottom: DIMENSION_16,
  );
  static final topAndHorizontalPadding = getPadding(
    top: DIMENSION_32,
    left: DIMENSION_16,
    right: DIMENSION_16,
  );
  static final incrementAndDecrementPadding =
      getSymmetricPadding(horizontal: DIMENSION_16, vertical: DIMENSION_12);
  static final labelPadding = getPadding(top: DIMENSION_20, left: DIMENSION_10);

  static final notificationPadding =
      getPadding(top: DIMENSION_8, left: DIMENSION_25);

  static final pendingPaddingInRequestScreen =
      getSymmetricPadding(horizontal: DIMENSION_8, vertical: DIMENSION_4);
}

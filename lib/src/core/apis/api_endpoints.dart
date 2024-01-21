import 'api_base.dart';

// Authentication Endpoints
final loginUrl = '$baseUrl/auth/user/login';
final resendOtpUrl = '$baseUrl/auth/user/resend-otp';
final registerUrl = '$baseUrl/auth/user/create';
final passwordResetUrl = '$baseUrl/auth/user/reset-password';
final forgotPasswordUrl = '$baseUrl/auth/user/forgot-password';
final verifyUrl = '$baseUrl/auth/user/verify-email';
final refreshTokenUrl = '$baseUrl/auth/user/regenerate-access-token';

// Post Endpoints
final postUrl = '$baseUrl/post';
final postViewUrl = '$baseUrl/post/save-views';
final adminPostUrl = '$baseUrl/post/get-admin-posts';
final getAnonymousUrl = '$baseUrl/social/pending-anonymous-post';
final anonymousPostUrl = '$baseUrl/social/anonymous-post';
final postCategoriesUrl = '$baseUrl/social/post-categories';

// Wallet Endpoints
final getWalletInfoUrl = '$baseUrl/payment/account-info';
final getWalletTransactionsUrl = '$baseUrl/payment/transactions';
final getWalletTransactionUrl = '$baseUrl/payment/transaction';
final getWalletBanksUrl = '$baseUrl/payment/bank-list';
final getWalletWithdrawUrl = '$baseUrl/payment/withdraw';
final getWalletValidateBankUri = '$baseUrl/payment/validate-account';
final getWalletGiftUserUri = '$baseUrl/payment/gift';
final getValidateKyc = '$baseUrl/payment/kyc';

final getTransactionPinUri = '$baseUrl/payment/transaction-pin';

/// Utilities
final getMobileOperatorsUri = '$baseUrl/payment/mobile-operators';
final buyAirtimeUri = '$baseUrl/payment/buy-airtime';
final buyDataUri = '$baseUrl/payment/buy-data';

final purchaseUtilityUri = '$baseUrl/payment/utilities';
final getCableUri = '$baseUrl/payment/cable-utilities';
final getStartimesUri = '$baseUrl/payment/get-startimes-utilities';
final getElectricityUri = '$baseUrl/payment/electricity-utilities';

final getReferralsUri = '$baseUrl/user/referrals';

final sendPinResetUri = '$baseUrl/payment/reset-txpin';

// Shop Endpoind
final shopUrl = '$baseUrl/market/shop';
final productsUrl = '$baseUrl/market/get-items';
final cartUrl = '$baseUrl/market/cart';
final whishlistUrl = '$baseUrl/market/wishlist';
final marketAddUrl = '$baseUrl/market/add-item';
final getProductCategoriesUrl = '$baseUrl/admin/shop/category';
final marketUrl = '$baseUrl/market';

// Talent Endpoints
final talentUrl = '$baseUrl/talent';

// Talent Endpoints
final liveUrl = '$baseUrl/skill-up/';

// Polls Endpoints
final pollsUrl = '$baseUrl/polls';
final pollsVoteUrl = '$baseUrl/polls/vote';

// User Endpoints
final userUrl = '$baseUrl/user';
final findUserUrl = '$baseUrl/user/username';
final changePasswordUrl = '$baseUrl/user/me/password';
final requestBadgeUrl = '$baseUrl/user/verification-badge';

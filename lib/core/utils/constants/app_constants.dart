/// timeout request constants
const String commonErrorUnexpectedMessage =
    'Something went wrong please try again';
const int timeoutRequestStatusCode = 1000;

/// app flavors strings
const String devEnvironmentString = 'DEV';
const String qaEnvironmentString = 'QA';
const String sitEnvironmentString = 'SIT';
const String uatEnvironmentString = 'UAT';
const String prodEnvironmentString = 'PROD';

///  IOException request constants
const String commonConnectionFailedMessage =
    'Please check your Internet Connection';
const int ioExceptionStatusCode = 900;

/// http client header constants

const String acceptLanguageKey = 'Accept-Language';
const String authorisationKey = 'Authorization';
const String bearerKey = 'Bearer ';
const String contentTypeKey = 'Content-Type';
const String contentTypeValue = 'application/json';
const String contentMultipartTypeValue = 'multipart/form-data';

///This is the time limit for every api call
const Duration timeOutDuration = Duration(seconds: 20);

///The app base Url should be provided in this value
const String devBaseUrl = 'https://api.openweathermap.org/data/2.5';
const String prodBaseUrl = 'https://api.openweathermap.org/data/2.5/prod';
const String qaBaseUrl = 'https://api.openweathermap.org/data/2.5/qa';
const String uatBaseUrl = 'https://api.openweathermap.org/data/2.5/uat';

/// getWeather details uri's and header keys
const String getWeatherDetails = '/weather';
const String appIdKey = 'appid';
const String appIdValue = '0ae6735afdc6f99d7af23db5d1bd1fbe';
const String cityNameKey = 'q';
const String latitudeKey = 'lat';
const String longitudeKey = 'lon';

/// local database keys
const String weatherInfoTable = 'WeatherInfo';

// api endpoints

const String signInEndPoint = 'signIn';
const String signUpEndPoint = 'signUp';
const String verifyOtpEndPoint = 'verifyOtp';
const String resendOtpEndPoint = 'resendOtp';
const String changePasswordEndPoint = '$updateUserEndPoint/changePassword';
const String updateUserEndPoint = 'user';
const String certificateEndPoint = 'certificate';
const String getCertificateSubTypesEndPoint = '$certificateEndPoint/subTypes';
const String getInspectorCertificateTypesEndPoint =
    '$certificateEndPoint/types';
const String getInspectorCertificateTAgenciesEndPoint =
    '$certificateEndPoint/agencies';
const String getJurisdictionCitiesEndPoint = 'cities/jurisdictions';
const String getInspectorDocumentTypeEndPoint = 'document/types';
const String getSettingsEndPoint = 'settings';
const String createBookingEndPoint = 'bookings';
const String bookingStatusEndPoint = 'status';
const String bookingTimerEndPoint = 'timer';
const String uploadImageEndPoint = 'uploads';
const String walletEndPoint = 'wallet';
const String paymentEndPoint = 'payments';
const String paymentIntentEndPoint = '$paymentEndPoint/paymentIntent';
const String onboardingEndPoint = '$paymentEndPoint/onboard';
const String notificationsEndPoint = 'notifications';
const String deductAndTransferWalletEndPoint =
    '$walletEndPoint/deductAndTransferWallet';
const String subscriptionEndPoint = 'subscriptionPlans';
const String userSubscriptionByIdEndPoint = 'subscriptions';

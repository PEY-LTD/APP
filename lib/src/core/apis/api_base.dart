import '../resources/enum.dart';

late String baseUrl;
late String baseDomain;

// Initialize API Bases for PRODUCTION or for STAGING
void initApi(Environment env) {
  switch (env) {
    case Environment.production:
      baseUrl = 'https://api-signnts-staging.up.railway.app/api/v1';
      baseDomain = '';
      break;

    case Environment.staging:
      baseUrl = 'https://api-signnts-staging.up.railway.app/api/v1';
      baseDomain = '';
      break;

    case Environment.development:
      baseUrl = 'https://api-signnts-staging.up.railway.app/api/v1';
      baseDomain = '';
      break;
  }
}

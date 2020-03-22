import 'package:amazon_cognito_identity_dart_2/cognito.dart';

import 'user_model.dart';

final CognitoUserPool userPool = CognitoUserPool(
  'eu-west-1_7Evb5m6QX',
  '13iljhocj3ajvlgalt2rq0mlbp',
  clientSecret: 'redacted',
);

User user;


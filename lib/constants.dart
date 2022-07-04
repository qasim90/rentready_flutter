import 'dart:io';

const apiBaseUrl = 'https://org696577ed.crm4.dynamics.com/api/data/v9.1/';

// AAD application id created with account qasim@appsoll.onmicrosoft.com
const oAuthClientId = 'df3c9d68-1879-4541-a787-23bf36fc1d20';
final authRedirectUri =
    Platform.isIOS ? 'msauth.rr://auth' : 'msauth://com.rentready.assignment/fjROYTVpEb6s5UU%2BPev5wEnppoI%3D';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

class _Env {
  static const List<int> _enviedkeyapiKey = [
    3505488357,
    1509053764,
    3305188379,
    251450716,
    1795111782,
    2783558521,
    1089375159,
    3720436254,
    1309199796,
    2913254827,
    1817459833,
    3537972773,
    2391040262,
    2023971215
  ];
  static const List<int> _envieddataapiKey = [
    3505488345,
    1509053757,
    3305188468,
    251450665,
    1795111700,
    2783558438,
    1089375190,
    3720436334,
    1309199837,
    2913254900,
    1817459730,
    3537972800,
    2391040383,
    2023971249
  ];
  static final String apiKey = String.fromCharCodes(
    List.generate(_envieddataapiKey.length, (i) => i, growable: false)
        .map((i) => _envieddataapiKey[i] ^ _enviedkeyapiKey[i])
        .toList(growable: false),
  );
}

// token_generator.dart

import 'dart:convert';
import 'package:crypto/crypto.dart';

String generateToken(String deviceId, String secretKey) {
  final key = utf8.encode(secretKey);
  final data = utf8.encode(deviceId);

  final hmacSha256 = Hmac(sha256, key);
  final digest = hmacSha256.convert(data);

  print(digest.toString());

  return digest.toString();
}

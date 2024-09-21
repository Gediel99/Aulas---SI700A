import 'dart:convert'; // Biblioteca para manipulação de JSON.
import 'dart:developer'; // Biblioteca para logs de depuração.
import 'package:googleapis/sheets/v4.dart'
    as sheets; // Biblioteca para interagir com Google Sheets.
import 'package:googleapis/drive/v3.dart'
    as drive; // Biblioteca para interagir com Google Drive.
import 'package:googleapis_auth/auth_io.dart'
    as auth; // Biblioteca para autenticação com APIs do Google.
import 'package:dio/dio.dart'; // Biblioteca para fazer requisições HTTP.
import 'package:flutter/services.dart'
    show rootBundle; // Biblioteca para carregar assets.

class SheetsDatabase {
  static SheetsDatabase helper = SheetsDatabase._createInstance();

  final _spreadsheetId = "1vcV82Vmfgp_xR8LFVmp2JpnC_6GVrjdGMbria9CNRLk";
  final _sheetName = 'Dados';

  SheetsDatabase._createInstance();

  Future<auth.AuthClient> getAuthClient() async {
    var credentialsJson =
        await rootBundle.loadString('assets/credentials.json');
    var credentials =
        auth.ServiceAccountCredentials.fromJson(json.decode(credentialsJson));
    final scopes = [
      sheets.SheetsApi.spreadsheetsScope,
      drive.DriveApi.driveScope
    ];
    return await auth.clientViaServiceAccount(credentials, scopes);
  }

  Future<String?> submitData(List<String> parsedResponse) async {
    var client = await getAuthClient();
    try {
      var dio = Dio();

      // Verifique se o número de colunas e o formato dos dados estão corretos
      if (parsedResponse.isEmpty) {
        log('No data provided to insert.'); // Log de erro.
        return "Nenhum dado fornecido para inserção."; // Mensagem de erro.
      }

      var accessToken = client.credentials.accessToken;
      var headers = {
        'Authorization': '${accessToken.type} ${accessToken.data}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

      var insertRange =
          '$_sheetName!A1'; // Ajuste o intervalo conforme necessário
      var requestBody = {
        'values': [parsedResponse]
      };

      log('Request Body for Insert: $requestBody');

      var responseResult = await dio.post(
        'https://sheets.googleapis.com/v4/spreadsheets/$_spreadsheetId/values/$insertRange:append?valueInputOption=RAW',
        options: Options(headers: headers),
        data: jsonEncode(requestBody),
      );

      log('Response from API: ${responseResult.data}');
      log('Data submitted successfully');
      return "success";
    } catch (e) {
      log('Error submitting data: $e');
      return "Erro ao submeter os dados: $e";
    }
  }
}

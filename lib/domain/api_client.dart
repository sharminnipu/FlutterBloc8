import 'package:dio/dio.dart';

class ApiClient {

  final  String _url='http://www.boredapi.com/api/';

  postData(formData,apiUrl) async{
    var fullUrl=_url+apiUrl;
    var dio = Dio();
    return dio.post(fullUrl,
        data:formData
      /* options: Options(
          followRedirects: false,
          validateStatus: (status) { return status < 500; }
      ),  */
    );
  }

 /* getHttpDataWithAuth(apiUrl) async{
    var fullUrl=_url+apiUrl;
    var token= await  _getToken();
    return http.get(Uri.parse(fullUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });

  } */
  postDataWithHeader(data,apiUrl) async{
    var fullUrl=_url+apiUrl;
    Dio dio = Dio();
    return dio.post(fullUrl,
      data: data,
      options: Options(headers: {
        'Accept': 'application/json',
      }),
    );

  }
  getDataWithoutToken(apiUrl) async{
    var fullUrl=_url+apiUrl;
    Dio dio = Dio();
    return dio.get(fullUrl,
      options: Options(headers: _setHeaders()),);

  }
 /* getDataWithAuth(apiUrl) async {
    var getToken= await  _getToken();
    var fullUrl = _url + apiUrl;
    Dio dio = new Dio();
    return dio.get(fullUrl,
      options: Options(headers: _setHeadersWithToken(getToken)),);

  }
  postDataWithAuth(data,apiUrl) async {
    var getToken= await  _getToken();
    var fullUrl = _url + apiUrl;
    Dio dio = new Dio();
    return dio.post(fullUrl,
      data: data,
      options: Options(headers: _setHeadersWithToken(getToken)),);

  }
  postDataWithAuthMultiPartForm(data,apiUrl) async {
    var getToken= await  _getToken();
    var fullUrl = _url + apiUrl;
    Dio dio = new Dio();
    return dio.post(fullUrl,
        data: data,
        options: Options(headers: _setHeadersWithMultiToken(getToken)),
        onSendProgress: (int send, int total) {
          print(" Progress : ${(send / total * 100).toStringAsFixed(0)}% ");
        });
  }  */


  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };
/*  _setHeadersWithToken(String token) => {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
  _setHeadersWithMultiToken(String token) => {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };  */
 /* _getToken() async {
    final _repo = Repository();
    final token = await _repo.getToken();
    print("token : $token");
    return token;
  } */

}
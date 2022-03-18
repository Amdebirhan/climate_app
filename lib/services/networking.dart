import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  //we use future becouse the method can tak an pridictable time to complete so it return a future and it will asign the value after
  //gets the data from the internet
  Future GetData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.body);
    }
  }
}

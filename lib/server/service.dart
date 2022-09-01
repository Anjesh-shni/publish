import 'package:publish/model/post_model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Comment>?> getPost() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/comments');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return commentFromJson(json);
    } else {
      print('Dtat not found');
    }
    return null;
  }
}

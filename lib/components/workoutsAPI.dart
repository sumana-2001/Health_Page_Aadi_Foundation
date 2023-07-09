import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:updated_health_app/models/detailsAPI.dart';


// Future<Details> fetchExerciseDetails() async {
//     final url =
//     Uri.parse("https://musclewiki.p.rapidapi.com/exercises");
//     final response = await http.get(
//       url,
//       headers: {
//         'X-RapidAPI-Key': 'b5456f97e6msh1dd2f8e51c41572p1fb1e6jsnfba016683d97',
//         'X-RapidAPI-Host': 'musclewiki.p.rapidapi.com'
//       },
//     );
//     var JSONobj = json.decode(response.body);
//     // print(JSONobj);
//     return Details.fromJson(JSONobj);
// }
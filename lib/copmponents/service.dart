import 'package:http/http.dart' as http;

import 'recipes_model.dart';

// פונקציה לקבלת פרטי מתכונים מהשרת
recipesItems() async {
  // יצירת כתובת ה-URL לבקשה
  Uri url = Uri.parse("https://dummyjson.com/recipes");
  // שליחת בקשה לשרת
  var res = await http.get(url);
  try {
    // בדיקה אם השרת החזיר תשובה תקינה
    if (res.statusCode == 200) {
      // המרה של התשובה למודל המתכונים
      var data = recipesModelFromJson(res.body);
      // החזרת רשימת המתכונים
      return data.recipes;
    } else {
      print("Error Occured");
    }
  } catch (e) {
    print(e.toString());
  }
}
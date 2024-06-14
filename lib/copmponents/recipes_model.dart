import 'dart:convert';

// פונקציה להמרת מחרוזת JSON למודל מתכונים
RecipesModel recipesModelFromJson(String str) =>
    RecipesModel.fromJson(json.decode(str));

// פונקציה להמרת מודל מתכונים למחרוזת JSON
String recipesModelToJson(RecipesModel data) => json.encode(data.toJson());

class RecipesModel {
  // רשימת המתכונים
  List<Recipe> recipes;
  // סך כל המתכונים
  int total;
  // מספר המתכונים שדולגו
  int skip;
  // הגבלה על מספר המתכונים
  int limit;

  RecipesModel({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  // פונקציה ליצירת מודל מתכונים ממפת JSON
  factory RecipesModel.fromJson(Map<String, dynamic> json) => RecipesModel(
        recipes: List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  // פונקציה להמרת מודל מתכונים למפת JSON
  Map<String, dynamic> toJson() => {
        "recipes": recipes.map((x) => x.toJson()).toList(),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Recipe {
  // מזהה המתכון
  int id;
  // שם המתכון
  String name;
  // רשימת המרכיבים
  List<String> ingredients;
  // רשימת ההוראות
  List<String> instructions;
  // זמן הכנה בדקות
  int prepTimeMinutes;
  // זמן בישול בדקות
  int cookTimeMinutes;
  // מספר מנות
  int servings;
  // רמת קושי
  Difficulty difficulty;
  // סוג המטבח
  String cuisine;
  // קלוריות למנה
  int caloriesPerServing;
  // רשימת תגים
  List<String> tags;
  // מזהה המשתמש
  int userId;
  // כתובת תמונת המתכון
  String image;
  // דירוג המתכון
  double rating;
  // מספר ביקורות
  int reviewCount;
  // סוג הארוחה
  List<String> mealType;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  // פונקציה ליצירת מודל מתכון ממפת JSON
  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        name: json["name"],
        ingredients: List<String>.from(json["ingredients"]),
        instructions: List<String>.from(json["instructions"]),
        prepTimeMinutes: json["prepTimeMinutes"],
        cookTimeMinutes: json["cookTimeMinutes"],
        servings: json["servings"],
        difficulty: difficultyValues.map[json["difficulty"]]!,
        cuisine: json["cuisine"],
        caloriesPerServing: json["caloriesPerServing"],
        tags: List<String>.from(json["tags"]),
        userId: json["userId"],
        image: json["image"],
        rating: json["rating"]?.toDouble() ?? 0.0,
        reviewCount: json["reviewCount"],
        mealType: List<String>.from(json["mealType"]),
      );

  // פונקציה להמרת מודל מתכון למפת JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": ingredients,
        "instructions": instructions,
        "prepTimeMinutes": prepTimeMinutes,
        "cookTimeMinutes": cookTimeMinutes,
        "servings": servings,
        "difficulty": difficultyValues.reverse[difficulty],
        "cuisine": cuisine,
        "caloriesPerServing": caloriesPerServing,
        "tags": tags,
        "userId": userId,
        "image": image,
        "rating": rating,
        "reviewCount": reviewCount,
        "mealType": mealType,
      };
}

// הגדרת רמות הקושי
enum Difficulty { EASY, MEDIUM }

// הגדרת ערכי המרה לאנום רמות הקושי
final difficultyValues = EnumValues({
  "Easy": Difficulty.EASY,
  "Medium": Difficulty.MEDIUM,
});

class EnumValues<T> {
  // מפת ערכים עבור אנום
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  // פונקציה להמרת מפת ערכים למפת מחרוזות
  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

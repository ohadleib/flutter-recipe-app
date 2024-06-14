import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'recipes_model.dart';
import 'service.dart';

class RecipesHomeScreen extends StatefulWidget {
  const RecipesHomeScreen({super.key});

  @override
  State<RecipesHomeScreen> createState() => _RecipesHomeScreenState();
}

class _RecipesHomeScreenState extends State<RecipesHomeScreen> {
  // רשימה של מתכונים
  List<Recipe> recipesModel = [];
  // מציין אם המידע נטען
  bool isLoading = false;

  // פונקציה להורדת מתכונים מהשרת
  myRecipes() {
    isLoading = true;
    recipesItems().then((value) {
      setState(() {
        recipesModel = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // טוען את המתכונים כאשר הוידג'ט מאתחל
    myRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // תפריט עליון של האפליקציה
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Recipes App From API",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto', // ניתן לשנות את הפונט במידת הצורך
            ),
          ),
        ),
        elevation: 0, // מסיר את הצל מתחת ל-AppBar
      ),
      body: isLoading
          // מציג אינדיקטור טעינה אם המידע נטען
          ? const Center(
              child: CircularProgressIndicator(),
            )
          // מציג רשימת מתכונים אם המידע נטען
          : ListView.builder(
              shrinkWrap: true,
              itemCount: recipesModel.length,
              itemBuilder: (context, index) {
                final recipes = recipesModel[index];
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    // מעביר למסך הפרטים כאשר לוחצים על המתכון
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(recipe: recipes),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: NetworkImage(recipes.image),
                              fit: BoxFit.fill,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(-5, 7),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: 45,
                            decoration: const BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      recipes.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                                Text(
                                  recipes.rating.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  recipes.cookTimeMinutes.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  " min",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 15),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
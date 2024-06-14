import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'recipes_model.dart';

class DetailScreen extends StatelessWidget {
  final Recipe recipe;
  const DetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    // קבלת גודל המסך הנוכחי
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // תצוגה ראשית שניתן לגלול
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // תצוגת תמונת המתכון
                Image.network(
                  recipe.image,
                  fit: BoxFit.cover,
                  height: 450,
                  width: size.width,
                ),
                // כפתור חזרה
               Padding(
                padding: MediaQuery.of(context).padding,
                child: Positioned(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 5.0), // Adjust the value as needed
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 30.0, // Larger size for better visibility
                        color: Colors.black, // Different color to make it stand out
                      ),
                    ),
                  ),
                ),
              ),


                // תיבת פרטי המתכון
                Positioned(
                  bottom: -50,
                  right: 30,
                  left: 30,
                  child: Container(
                    height: 140,
                    width: size.width,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recipe.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    recipe.mealType[0],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    " & ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    recipe.cuisine,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // תצוגת פרטי דירוג וזמן בישול
                        Container(
                          height: 50,
                          width: size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 35),
                              const Icon(Icons.star, color: Colors.orange),
                              Text(recipe.rating.toString()),
                              const SizedBox(width: 50),
                              const Icon(Icons.timer, color: Colors.blueAccent),
                              Text(recipe.cookTimeMinutes.toString()),
                              const SizedBox(width: 50),
                              const Icon(Icons.accessibility,
                                  color: Colors.black),
                              Text(
                                  "${recipe.caloriesPerServing.toString()} kcl"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    "Ingredients",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            List.generate(recipe.ingredients.length, (index) {
                          return Text(
                            "- ${recipe.ingredients[index]}",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          );
                        })),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Instructions",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        recipe.instructions.length,
                        (index) {
                          return Text(
                            "- ${recipe.instructions[index]}",
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
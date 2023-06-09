import 'package:client/src/model/food.dart';
import 'package:flutter/material.dart';

class FridgeFoodCard extends StatelessWidget {
  const FridgeFoodCard(
      {super.key, required this.name, required this.expiryDate});
  final String name;
  final String expiryDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      color: const Color(0xffFDFCFF),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Flexible(
          flex: 3,
          child: Container(
              margin: const EdgeInsets.all(5.0),
              child: const Icon(Icons.food_bank_outlined)),
        ),
        Flexible(
          flex: 10,
          child: Container(
            width: 210,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name, // 식품명
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  expiryDate, // 유통기한
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Container(
            child: IconButton(
              icon: const Icon(Icons.delete_outline_rounded),
              onPressed: () {},
            ),
          ),
        ),
        Flexible(
            flex: 2,
            child: Container(
              child: IconButton(
                icon: const Icon(Icons.create_outlined),
                onPressed: () {},
              ),
            ))
      ]),
    );
  }
}

import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(116, 119, 127, 0.1),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal:16),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Color.fromRGBO(116, 119, 127, 1),),
                      SizedBox(width: 10,),
                      Expanded(child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none
                        ),
                      ))
                    ],
                  ),
                )
              )
            );
  }
}
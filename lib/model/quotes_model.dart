import 'package:flutter/material.dart';

class Quotes {
  final int id;
  final String quote;
  final String author;

  Quotes({required this.id, required this.quote, required this.author});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(id: json['id'], quote: json['quote'], author: json['author']);
  }
}

class QuotesModel extends StatelessWidget {
  final Quotes quote;
  const QuotesModel({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 5.0,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            quote.quote,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            quote.author,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}

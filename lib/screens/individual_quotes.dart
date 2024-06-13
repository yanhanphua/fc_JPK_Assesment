import 'package:flutter/material.dart';
import 'package:jpk_assesment/api/quotes_api.dart';
import 'package:jpk_assesment/model/quotes_model.dart';

class IndividualQuotes extends StatelessWidget {
  final Quotes quotes;
  const IndividualQuotes({super.key, required this.quotes});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, //Remove the back arrow button
          title: Text(
            "Quote No. ${quotes.id}",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quote No. ${quotes.id}",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Container(
                width: 350,
                height: 350,
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 25,
                  right: 25,
                  bottom: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        quotes.quote,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment:
                          Alignment.centerRight, // Align the text to the right
                      child: Text(
                        quotes.author,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  "Back to Home",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        )));
  }
}

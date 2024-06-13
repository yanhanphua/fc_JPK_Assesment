import 'package:flutter/material.dart';
import 'package:jpk_assesment/api/quotes_api.dart';
import 'package:jpk_assesment/model/quotes_model.dart';

class ShowAllQuotes extends StatefulWidget {
  const ShowAllQuotes({super.key});

  @override
  _ShowAllQuotesState createState() => _ShowAllQuotesState();
}

class _ShowAllQuotesState extends State<ShowAllQuotes> {
  late Future<List<Quotes>> futureQuotes;
  List<Quotes> allQuotes = [];

  @override
  void initState() {
    super.initState();
    futureQuotes = QuotesApi().getQuotes();
    futureQuotes.then((value) {
      setState(() {
        allQuotes = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "All Quotes",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: FutureBuilder<List<Quotes>>(
                    future: futureQuotes,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text(
                                "Failed to load Quotes, Please try again"));
                      } else {
                        return ListView.builder(
                            itemCount: allQuotes.length,
                            itemBuilder: (context, index) {
                              return QuotesModel(quote: allQuotes[index]);
                            });
                      }
                    })),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 25),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text(
                    "Back to Home",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ));
  }
}

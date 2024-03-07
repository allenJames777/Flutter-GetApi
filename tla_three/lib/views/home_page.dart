import 'package:flutter/material.dart';
import 'package:tla_three/services/remote_service.dart';
import 'package:tla_three/models/json_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Advice? postCards;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    //wait to get response
    postCards = await AdviceService().fetchRandomAdvice();
    if (postCards != null) {
      //check kung naay unod
      setState(() {
        isLoaded = true; //kung naay unod mag post
      });
    }
  }

  Future<void> _refresh() async {
    //fetch random advice
    postCards = await AdviceService().fetchRandomAdvice();
    if (postCards != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADVICE"),
      ),
      body: Center(
        child: isLoaded
            ? Text(
                postCards?.advice ??
                    'No advice available', // Display advice or a message if it's null
                style: const TextStyle(fontSize: 24),
              )
            : const CircularProgressIndicator(), // Display a loading indicator if data is not yet available
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 220),
        child: Center(
          child: FloatingActionButton(
            onPressed: _refresh,
            child: const Icon(Icons.refresh),
          ),
        ),
      ),
    );
  }
}

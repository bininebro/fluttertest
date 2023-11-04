import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_nterview/ViewModels/home_view_model.dart';
import 'package:test_nterview/Views/message_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Interview App'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MessageDetail(),
                    ),
                  );
                },
                child: const Icon(Icons.list),
              ),
            )
          ],
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            // Build your UI using data from viewModel

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter a text to encrypt and save',
                      errorText: isEmpty ? 'Can\'t be empty' : null,
                    ),
                    onChanged: (text) =>
                        setState(() => isEmpty = (textController.text == '')),
                  ),
                ), // Access data from the view model
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    (isEmpty || textController.text == '')
                        ? setState(() => isEmpty = (textController.text == ''))
                        : viewModel.updateMessage(textController.text);
                    textController.text =
                        ''; //// Call methods in the view model
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Encrypt and Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ); // Pass the view model to your widget
          },
        ),
      ),
    );
  }
}

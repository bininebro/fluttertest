import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_nterview/ViewModels/home_view_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Interview App'),
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a text to encrypt and save',
                    ),
                  ),
                ), // Access data from the view model
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    viewModel.updateMessage(textController
                        .text); //// Call methods in the view model
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

                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.red, width: 5),
                  ),
                  onPressed: () {
                    viewModel.updateMessage(textController
                        .text); //// Call methods in the view model
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

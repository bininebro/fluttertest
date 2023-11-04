import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModels/message_details_view_model.dart';

class MessageDetail extends StatelessWidget {
  MessageDetail({Key? key}) : super(key: key);
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MessageDetailViewModel>(
      create: (context) => MessageDetailViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Interview App'),
        ),
        body: Consumer<MessageDetailViewModel>(
          builder: (context, viewModel, child) {
            // Build your UI using data from viewModel
            return (viewModel.decryptedList == null)
                ? const Center(child: Text('There is no data '))
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: viewModel.decryptedList?.length,
                        itemBuilder: (context, index) {
                          return (viewModel.decryptedList == null ||
                                  viewModel.decryptedList!.isEmpty)
                              ? Container()
                              : Center(
                                  child: ListTile(
                                    title: Text(
                                      viewModel.decryptedList![index] ?? "null",
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                );
                        }),
                  ); // Pass the view model to your widget
          },
        ),
      ),
    );
  }
}

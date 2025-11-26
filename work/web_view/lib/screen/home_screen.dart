import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeUrl = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {
  /// final result = WebViewController().loadRequest();
  /// final controller = WebViewController();
  /// final result = controller.loadRequest();
  ///
  /// final test2 = WebViewController()..loadRequest();
  ///
  /// final controller2 = WebViewController();
  /// controller2.loadRequest();

  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(homeUrl);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Code Factory'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              controller.loadRequest(homeUrl);
            },
            icon: Icon(
              Icons.home,
            ),
          ),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

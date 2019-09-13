import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  final controller;

  WebViewContainer(this.url, this.controller);

  @override
  _WebViewContainerState createState() =>
      _WebViewContainerState(this.url, this.controller);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();
  WebViewController _controller;

  _WebViewContainerState(this._url, this._controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: _url,
              onWebViewCreated: (WebViewController webViewController) async {
                _controller = webViewController;
                var dd = await _controller.currentUrl();
                print("======== $dd ========");
              },
            ),
          )
        ],
      ),
      floatingActionButton: _bookmarkButton(context, _controller),
    );
  }

  _bookmarkButton(BuildContext context ,WebViewController _controller) {
    return FloatingActionButton(
      onPressed: () async {
        var url = await _controller.currentUrl();
        print("@@@@@@@@@ $url @@@@@@@@@");
      },
      child: Icon(Icons.favorite),
    );
  }
}

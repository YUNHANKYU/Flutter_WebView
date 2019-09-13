import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'web_view_container.dart';


class WebView extends StatelessWidget {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    final _links = ['https://flutter.dev/', 'https://google.com/', 'https://m.naver.com/'];

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _links.map((link) => _urlButton(context, link)).toList(),
        ),
      )),
      appBar: AppBar(
        title: Text("title"),
      ),
      drawer: Drawer(
        child:

        ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ..._links.map((String link) => tiles(context, link)).toList(),

          ],
        ),

      ),
    );
  }

  Widget _urlButton(BuildContext context, String links) {
    return Container(
      padding: EdgeInsets.all(20),
      child: FlatButton(
        color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          onPressed: ()=> _handleUrlButtonPressed(context, links),
          child: Text(links)
      ),
    );
  }

  void _handleUrlButtonPressed(BuildContext context, String links) {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => WebViewContainer(links, _controller)));
  }

  Widget tiles(BuildContext context ,String link) {
    return
      ListTile(
      title: Text('$link'),
      onTap: () {
        _handleUrlButtonPressed(context, link);
      },
    );
  }
}

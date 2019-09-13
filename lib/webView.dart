import 'package:flutter/material.dart';
import 'web_view_container.dart';


class WebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _links = ['https://flutter.dev/', 'https://google.com/'];

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _links.map((link) => _urlButton(context, link)).toList(),
        ),
      )),
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
    MaterialPageRoute(builder: (context) => WebViewContainer(links)));
  }
}

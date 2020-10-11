import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class RecommendationPage extends StatelessWidget {
  static const Route = '/recommendation';
  @override
  Widget build(BuildContext context) {
    List<Mobile> _recommend = Provider.of<Mobile>(context).recommendations;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: bodyText(context),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SingleSectionItem(
                item: _recommend[0],
                displayText: true,
                height: 300,
                width: 250,
              ),
              Text(
                'Similar Phones',
                style: Theme.of(context).textTheme.headline4,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var i = 0; i < _recommend.length - 1; i++)
                      SingleSectionItem(
                        item: _recommend[i + 1],
                        displayText: true,
                      )
                  ],
                ),
              ),
              RaisedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed(FilterPage.Route);
                },
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                icon: Icon(Icons.mobile_friendly),
                label: Text('Change Filter'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

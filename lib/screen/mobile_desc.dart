import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';
import 'package:spiral_app/widget/description_wid.dart';

class MobilePage extends StatelessWidget {
  static const Route = '/mobilePage';
  @override
  Widget build(BuildContext context) {
    Mobile mobile = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    List _keys = description.keys.toList();
    List _keysMobile = mobile.specs.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(mobile.name, style: bodyText(context)),
      ),
      body: Container(
        // padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SingleSectionItem(
                    item: mobile,
                    displayText: false,
                    height: size.height * 0.4,
                    width: size.width * 0.6,
                  ),
                  Column(
                    children: [
                      for (var i = 0; i < 4; i++)
                        Descriptions(
                          keys: _keys,
                          i: i,
                          mobile: mobile,
                          size: size,
                        ),
                    ],
                  ),
                ],
              ),
            ),
            DescriptionButton(mobile: mobile),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Description',
                style: Theme.of(context).textTheme.headline1.copyWith(
                      fontSize: 40,
                      color: Colors.white,
                    ),
              ),
            ),
            Expanded(
              // height: MediaQuery.of(context).size.height * 0.2,
              // padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
              flex: 2,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < _keysMobile.length; i++)
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${_keysMobile[i]} :  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(
                                text: '${mobile.specs[_keysMobile[i]]}',
                                style: TextStyle(
                                  fontSize: 15,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: RaisedButton.icon(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                onPressed: () {},
                icon: Icon(Icons.shopping_bag),
                label: Text('Buy Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

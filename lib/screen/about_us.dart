import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class AboutUs extends StatelessWidget {
  static const Route = '/aboutUs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: bodyText(context),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    child: Text('LOGO'),
                    radius: 80,
                  ),
                  Text('Here Some text about the app.'),
                  Row(
                    children: [
                      // TODO add icon for website and linkedin
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    child: Text('LOGO'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Spiral Developers',
                        style: bodyText(context),
                      ),
                      Text('Here some text about the company'),
                    ],
                  ),
                ],
              ),
              Center(
                child: Text(
                  'Founders',
                  style: bodyText(context),
                ),
              ),
              // TODO add images of founder and instagram handles
            ],
          ),
        ),
      ),
    );
  }
}

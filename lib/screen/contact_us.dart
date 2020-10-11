import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class ContactUs extends StatefulWidget {
  static const Route = '/contactUs';

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool _message = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: bodyText(context),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.all(30),
                child: !_message
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextField(
                            onChanged: (val) {
                              print(val);
                            },
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          TextField(
                            onChanged: (val) {
                              print(val);
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              labelText: 'Any Message For Us.',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2),
                              ),
                            ),
                          ),
                          RaisedButton.icon(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            icon: Icon(Icons.message),
                            onPressed: () {
                              setState(() {
                                _message = true;
                              });
                            },
                            label: Text('Send Message'),
                          )
                        ],
                      )
                    : LimitedBox(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Thank\nYou!\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                        fontSize: 90, color: Colors.white),
                              ),
                              TextSpan(
                                  text: '\nWe\'ll Contact you soon!',
                                  style: Theme.of(context).textTheme.headline4)
                            ],
                          ),
                        ),
                      ),
                height: size.height * 0.5,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: !_message ? kBackContainer : kPrimaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Or\nEmail us at',
                textAlign: TextAlign.center,
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.email_rounded),
                label: Text(
                  'spiraldev1415@gmail.com',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

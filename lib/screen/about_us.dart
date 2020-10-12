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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: kPrimaryColor,
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.fitWidth,
                      ),
                      radius: 80,
                    ),
                    Text('Here Some text about the app.'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // TODO linked in
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/linkedin.png',
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            // TODO website
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/globe.png',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Image.asset('assets/logo.png'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
              ),
              Center(
                child: Text(
                  'Founders',
                  style: bodyText(context),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Founder(
                      founder: 'Founder 1',
                      onPressed: () {},
                      imageUrl: 'assets/user.png',
                    ),
                    Founder(
                      founder: 'Founder 2',
                      onPressed: () {},
                      imageUrl: 'assets/user.png',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Founder extends StatelessWidget {
  const Founder({
    this.founder,
    this.imageUrl,
    this.onPressed,
  });
  final String imageUrl;
  final String founder;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          child: Image.asset(imageUrl),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          founder,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: onPressed,
          child: Container(
            height: 30,
            width: 30,
            child: Image.asset('assets/instagram.png'),
          ),
        )
      ],
    );
  }
}

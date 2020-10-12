import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class LandingPage extends StatefulWidget {
  static const LandingRoute = '/';
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int current = 0;
  List<Mobile> mobileCard = mobiles.sublist(0, 3);

  @override
  Widget build(BuildContext context) {
    final _mob = Provider.of<Mobile>(context).comparePhone;
    return Scaffold(
      bottomNavigationBar: BottomBar(
        current: current,
        routes: routes,
      ),
      drawer: Drawer(
        elevation: 10,
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                padding: EdgeInsets.zero,
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomLeft,
                  width: double.infinity,
                  child: Text(
                    'Recsy',
                    style: TextStyle(fontSize: 40),
                  ),
                  color: kPrimaryColor,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        foregroundColor: Colors.white,
                        child: Text('V/S'),
                      ),
                      title: Text('Compare'),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          SearchPage.Route,
                          arguments: {
                            'mobiles': _mob,
                            'selected': 0,
                            'compare': true
                          },
                        );
                      },
                    ),
                    Divider(
                      color: Colors.grey,
                      endIndent: 30,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed(AboutUs.Route);
                      },
                      leading: Icon(
                        Icons.supervisor_account_rounded,
                        size: 40,
                        color: kPrimaryColor,
                      ),
                      title: Text('About Us'),
                    ),
                    Divider(
                      color: Colors.grey,
                      endIndent: 30,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed(ContactUs.Route);
                      },
                      leading: Icon(
                        Icons.mail,
                        size: 40,
                        color: kPrimaryColor,
                      ),
                      title: Text('Contact Us'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Recsy',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: EdgeInsets.all(10),
          child: Column(
            children: [
              BannerList(),
              SectionItem(
                title: 'You May Also Like',
                list: mobileCard,
                displayText: true,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CompareWidget(),
              ),
              SectionItem(
                title: 'Top Performing',
                list: mobileCard,
                displayText: true,
              ),
              SectionItem(
                title: 'Top Camera',
                list: mobiles.sublist(4, 7),
                displayText: true,
              ),
              SectionItem(
                title: 'Top Rated',
                list: mobiles.sublist(5, 8),
                displayText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spiral_app/export.dart';

class UserProfile extends StatelessWidget {
  static const Route = '/user';
  @override
  Widget build(BuildContext context) {
    List<Mobile> _fav = Provider.of<Mobile>(context).favorites;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      onSelected: (value) {
                        // TODO execute change password
                      },
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                              value: 0, child: Text("Change Password"))
                        ];
                      },
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: kPrimaryColor,
                            foregroundColor: Colors.white,
                            child: Icon(
                              Icons.person,
                              size: 90,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Username',
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                height: size.height * 0.5,
                decoration: BoxDecoration(
                    color: Color(0xff3E3E3E),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Favorite',
                      style: TextStyle(fontSize: 30),
                    ),
                    Container(
                      height: size.height * 0.5,
                      child: _fav.isEmpty
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      size: 80,
                                      color: Colors.grey,
                                    ),
                                    Text('No Favorites Yet')
                                  ],
                                ),
                              ),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 4 / 5,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: _fav.length,
                              itemBuilder: (context, index) {
                                return SingleSectionItem(
                                  item: _fav[index],
                                  displayText: true,
                                  height: 300,
                                  width: size.width * 0.4,
                                );
                              },
                            ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(current: 2, routes: routes),
    );
  }
}

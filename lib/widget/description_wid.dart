import 'package:spiral_app/export.dart';
import 'package:flutter/material.dart';

class DescriptionButton extends StatefulWidget {
  const DescriptionButton({
    Key key,
    @required this.mobile,
  }) : super(key: key);

  final Mobile mobile;

  @override
  _DescriptionButtonState createState() => _DescriptionButtonState();
}

class _DescriptionButtonState extends State<DescriptionButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FlatButton.icon(
          onPressed: () {
            setState(() {
              Provider.of<Mobile>(context, listen: false)
                  .changeFav(widget.mobile.id);
            });
          },
          icon: Icon(
            Icons.favorite,
            size: 40,
            color: widget.mobile.isFav ? kPrimaryColor : Colors.white,
          ),
          label: Text(
            'Favorite',
            style: TextStyle(
              color: widget.mobile.isFav ? kPrimaryColor : Colors.white,
            ),
          ),
        ),
        FlatButton.icon(
          onPressed: () {
            setState(() {
              Provider.of<Mobile>(context, listen: false)
                  .randomCompare(0, widget.mobile);
              Navigator.of(context).pushNamed(SearchPage.Route,
                  arguments: {'compare': true, 'selected': 1});
            });
          },
          icon: CircleAvatar(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
            child: Text('V/S'),
          ),
          label: Text('Compare'),
        ),
      ],
    );
  }
}

class Descriptions extends StatelessWidget {
  const Descriptions({
    Key key,
    @required List keys,
    @required this.i,
    @required this.mobile,
    @required this.size,
  })  : _keys = keys,
        super(key: key);

  final List _keys;
  final int i;
  final Mobile mobile;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FittedBox(child: Text(_keys[i])),
          if (_keys[i] != 'Performance')
            Icon(
              description[_keys[i]],
              size: 40,
            ),
          if (_keys[i] == 'Performance')
            Container(
                height: 50,
                width: 50,
                child: Image.asset(
                  'assets/cpu.png',
                  fit: BoxFit.cover,
                )),
          FittedBox(child: Text(mobile.specs[_keys[i]])),
        ],
      ),
      margin: EdgeInsets.only(bottom: 5, top: 5),
      height: size.height * 0.11,
      width: size.height * 0.12,
      decoration: BoxDecoration(
        color: Color(0xff53C3CB),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data: ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    print(data);

    //Setting BG Image
    String bgImage = data['isDayTime'] == true ? 'day.png' : 'night.png';
    Color? bgColor =
        data['isDayTime'] == true ? Colors.blue[300] : Colors.indigo[700];
    Color? textColor = data['isDayTime'] == true ? Colors.black : Colors.white;
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(children: <Widget>[
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/choose');
                  print(result);
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'time': result['time'],
                      'isDayTime': result['isDayTime'],
                      'flag': result['flag'],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],
                ),
                label: Text('Edit Location',
                    style: TextStyle(color: Colors.grey[300])),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data!['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66,
                  color: Colors.white,
                ),
              )
            ]),
          ),
        )));
  }
}

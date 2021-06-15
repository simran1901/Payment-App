import 'package:flutter/material.dart';
import '../providers/friends.dart';
import '../screens/screen1.dart';
import './screen3.dart';

class Screen2 extends StatelessWidget {
  static String routeName = '/screen2';
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fr = ModalRoute.of(context)!.settings.arguments as Friend;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_down),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    '${fr.firstName} ${fr.lastName}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    fr.upi,
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.green,
                    backgroundImage:
                        fr.image != '' ? AssetImage(fr.image) : null,
                    child: fr.image == ''
                        ? Text(
                            fr.firstName[0],
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w500),
                          )
                        : null,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(26, 20, 67, 1)),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Screen3('TRANSACTIONS'),
                              ),
                            );
                          },
                          child: Text(
                            'TRANSACTIONS',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(26, 20, 67, 1)),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Screen3('MESSAGE'),
                              ),
                            );
                          },
                          child: Text(
                            'MESSAGE',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20)),
                    color: Color.fromRGBO(244, 243, 248, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 15),
                        child: Text(
                          'YOUR RELATIONSHIP',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      StatsTile(
                          exchanges: fr.exchanges,
                          paybacks: fr.paybacks,
                          dues: fr.dues),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          top: 15,
                          bottom: 10,
                        ),
                        child: Text('UPCOMING',
                            style: TextStyle(color: Colors.grey)),
                      ),
                      ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ClipPath(
                              clipper: ShapeBorderClipper(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              child: Card(
                                shape: Border(
                                  right:
                                      BorderSide(color: Colors.green, width: 5),
                                ),
                                child: ListTile(
                                  visualDensity: VisualDensity(vertical: -4),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  leading: CircleAvatar(
                                    radius: 18,
                                    backgroundImage: fr.image != ''
                                        ? AssetImage(fr.image)
                                        : null,
                                    backgroundColor: Colors.green,
                                    child: fr.image == ''
                                        ? Text(
                                            fr.firstName[0],
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          )
                                        : null,
                                  ),
                                  title: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Re: Pragati',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 10),
                                      Text('22 Aug',
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(fr.firstName,
                                          style:
                                              TextStyle(color: Colors.black)),
                                      Text(
                                        'to You',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  trailing: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          '\u{20B9}87',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).primaryColor,
              child: ListTile(
                leading: IconButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Screen3('Icon Button'),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.yellow,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Screen3('Floating Action Button'),
            ),
          );
        },
        backgroundColor: Color.fromRGBO(244, 243, 248, 1),
      ),
    );
  }
}

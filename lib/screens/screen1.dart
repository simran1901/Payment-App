import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:payments_app/screens/screen3.dart';

import '../providers/friends.dart';
import './screen2.dart';

class Screen1 extends StatefulWidget {
  static String routeName = '/screen1';
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    final frnd = Friends();
    final frequentList = frnd.frequent;
    final recentList = frnd.recent;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  // tileColor: Theme.of(context).primaryColor,
                  title: Text(
                    'Jay Sethi',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'reachjaysethi-1@oksbi',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ),
                SizedBox(height: 30),
                if (_expanded)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'FREQUENTLY CONTACTED',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 5,
                      childAspectRatio: 1 / 1.2,
                      // crossAxisSpacing: 8,
                      // mainAxisSpacing: 8,
                    ),
                    itemCount: _expanded ? frequentList.length : 5,
                    itemBuilder: (BuildContext ctx, index) {
                      if (_expanded || index != 4)
                        return FriendCard(frequentList[index]);
                      else
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey[400],
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _expanded = true;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text('RECENTS',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.white)),
                            ],
                          ),
                        );
                    }),
                if (_expanded)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      left: 8,
                      bottom: 8,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'RECENTS',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.keyboard_arrow_up_outlined,
                            color: Colors.grey)
                      ],
                    ),
                  ),
                if (_expanded)
                  GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width / 5,
                        childAspectRatio: 1 / 1.2,
                        // crossAxisSpacing: 8,
                        // mainAxisSpacing: 8,
                      ),
                      itemCount: recentList.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return FriendCard(recentList[index]);
                      }),
                _expanded ? ListTile() : SizedBox(height: 20),
                if (!_expanded)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: double.infinity,
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
                            'YOUR ACCOUNT',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        StatsTile(
                            exchanges: '1.2L', paybacks: '129', dues: '4632'),
                        RRCard(),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          if (_expanded)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                ),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      _expanded = false;
                    });
                  },
                  title: Text(
                    'YOUR ACCOUNT',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_up_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class StatsTile extends StatelessWidget {
  StatsTile({this.exchanges = '0', this.paybacks = '0', this.dues = '0'});
  final String exchanges;
  final String paybacks;
  final String dues;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\u{20B9}$exchanges',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'total',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                'exchanges',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\u{20B9}$paybacks',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'upcoming',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                'paybacks',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\u{20B9}$dues',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'upcoming',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                'dues',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class RRCard extends StatefulWidget {
  const RRCard({
    Key? key,
  }) : super(key: key);

  @override
  _RRCardState createState() => _RRCardState();
}

class _RRCardState extends State<RRCard> {
  bool _return = true;
  bool _friends = false;

  @override
  Widget build(BuildContext context) {
    final friendList = Friends().friend;
    return AnimatedContainer(
      duration: Duration(milliseconds: 20),
      child: Card(
        color: Color.fromRGBO(254, 254, 254, 1),
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                // left: 15,
                right: 15,
                top: 20,
                bottom: 15,
              ),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _return = true;
                      });
                    },
                    child: Text(
                      _return ? 'return\n—' : 'return\n',
                      style: TextStyle(
                          color: _return ? Colors.black : Colors.grey[600],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _return = false;
                      });
                    },
                    child: Text(
                      _return ? 'receive\n' : 'receive\n—',
                      style: TextStyle(
                          color: _return ? Colors.grey[600] : Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_return ? 'RETURNED' : 'RECEIVED',
                          style: TextStyle(color: Colors.grey)),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\u{20B9}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            _return ? '38,138' : '29,256',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ],
                      ),
                      Text(
                        _return ? '  of \u{20B9}42,812' : '  of \u{20B9}30,475',
                        style: TextStyle(
                          color: Colors.grey[600],
                          // fontWeight: FontWeight.bold,
                          // fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text('UPCOMING', style: TextStyle(color: Colors.grey)),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\u{20B9}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            _return ? '4,632' : '1,219',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ],
                      ),
                      Text(
                        _return ? '  of \u{20B9}42,812' : '  of \u{20B9}30,475',
                        style: TextStyle(
                          color: Colors.grey[600],
                          // fontWeight: FontWeight.bold,
                          // fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 150,
                  width: 150,
                  child: Stack(
                    children: [
                      PieChart(
                        PieChartData(
                          startDegreeOffset: -90,
                          centerSpaceRadius: 56.46,
                          centerSpaceColor: Colors.transparent,
                          borderData: FlBorderData(show: false),
                          sections: [
                            PieChartSectionData(
                              showTitle: false,
                              radius: 10.54,
                              value: _return ? 93 : 89,
                              color: Colors.green,
                            ),
                            PieChartSectionData(
                              showTitle: false,
                              radius: 10.54,
                              value: _return ? 5 : 11,
                              color: Colors.red[300],
                            ),
                            if (_return)
                              PieChartSectionData(
                                showTitle: false,
                                radius: 10.54,
                                value: 2,
                                color: Colors.red,
                              ),
                          ],
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _return ? '93%' : '89%',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(_return ? 'returned' : 'received',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          radius: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (!_return)
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('NEXT TO DAYS',
                            style: TextStyle(color: Colors.grey)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '92',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            // SizedBox(width: 5),
                            Text(
                              '%',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TIME UNTIL 100%',
                            style: TextStyle(color: Colors.grey)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '128',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'days',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            if (!_return) SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FRIENDS',
                    style: TextStyle(color: Colors.grey),
                  ),
                  if (_friends)
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_down),
                      onPressed: () {
                        setState(() {
                          _friends = false;
                        });
                      },
                    ),
                ],
              ),
            ),
            if (!_friends)
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 12, bottom: 20),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12.66,
                          backgroundImage: AssetImage(friendList[3].image),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.01),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 10,
                      child: CircleAvatar(
                        radius: 12.66,
                        backgroundImage: AssetImage(friendList[2].image),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.01),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      child: CircleAvatar(
                        radius: 12.66,
                        backgroundImage: AssetImage(friendList[1].image),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.01),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      child: CircleAvatar(
                        radius: 12.66,
                        backgroundImage: AssetImage(friendList[0].image),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.01),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -11,
                      left: 50,
                      child: IconButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          setState(() {
                            _friends = true;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            if (_friends)
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: friendList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Screen3(
                              '${friendList[index].firstName} ${friendList[index].lastName}'),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: friendList[index].image == ''
                          ? Text(
                              friendList[index].firstName[0],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            )
                          : null,
                      backgroundImage: friendList[index].image != ''
                          ? AssetImage(friendList[index].image)
                          : null,
                    ),
                    title: Text(
                        '${friendList[index].firstName} ${friendList[index].lastName}'),
                    subtitle:
                        Text('last interacted ${friendList[index].days}d ago'),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\u{20B9}${friendList[index].amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          'due',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class FriendCard extends StatelessWidget {
  FriendCard(this.fr);
  final Friend fr;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            Screen2.routeName,
            arguments: fr,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: fr.image != '' ? AssetImage(fr.image) : null,
              backgroundColor: Colors.green,
              radius: 20,
              child: fr.image == ''
                  ? Text(
                      fr.firstName[0],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  : null,
            ),
            SizedBox(height: 8),
            Text(fr.firstName,
                maxLines: 1,
                style: TextStyle(fontSize: 11, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

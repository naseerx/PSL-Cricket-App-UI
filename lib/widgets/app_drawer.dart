import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:t20_wc/screens/history_screen.dart';
import 'package:t20_wc/screens/schedule_screen.dart';
import 'package:t20_wc/screens/teams_screen.dart';
import 'package:t20_wc/screens/venue_screen.dart';
import 'package:t20_wc/utile/check_net.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawer_list.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _url1 = 'https://www.icc-cricket.com/live-cricket/live';
    void _launchURL() async {
      if (!await launch(_url1)) throw 'Could not launch $_url1';
    }

    String _url2 = 'https://www.icc-cricket.com/live-cricket/live';
    void _launchURL2() async {
      if (!await launch(_url2)) throw 'Could not launch $_url2';
    }
    String _url3 = 'https://www.ptcp.pk/';
    void _launchURL3() async {
      if (!await launch(_url3)) throw 'Could not launch $_url3';
    }

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.grey),
      child: Drawer(
        child: ListView(
          // padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset(
                'assets/logo.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Color(0xff10044a),
              ),
            ),
            DraweList(iconsData: Icons.home, title: 'HOME', onTap:(){
              Navigator.of(context).pop();
            }, ),
            DraweList(iconsData: Icons.schedule, title: 'SCHEDULE', onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (contex) {
                return ScheduleScreen();
              }));
            },),
            DraweList(iconsData: Icons.location_on_outlined, title: 'VENUES', onTap:  () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return VenueScreen();
              }));
            },),
            
           DraweList(iconsData: Icons.history, title: 'HISTORY', onTap: () {
             Navigator.of(context)
                 .push(MaterialPageRoute(builder: (context) {
               return HistoryScreen();
             }));
           },),
           DraweList(iconsData: Icons.supervisor_account, title: 'TEAMS', onTap: () {
             Navigator.of(context)
                 .push(MaterialPageRoute(builder: (context) {
               return TeamsScreen();
             }));
           }),
            DraweList(iconsData: Icons.live_tv, title: 'LIVE SCORE', onTap: () async {
              if (await CheckNet.isConnected()) {
                _launchURL2();
              } else {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.ERROR,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'No Internet Connection',
                  desc:
                  'Please Connect to a mobile Cellular data or wifi connection',
                  btnOkOnPress: () {},
                  btnOkColor: Colors.green,
                )..show();
              }
            }),
            DraweList(iconsData: Icons.video_call, title: 'HIGHLIGHTS', onTap: () async {
              if (await CheckNet.isConnected()) {
                _launchURL();
              } else {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.ERROR,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'No Internet Connection',
                  desc:
                  'Please Connect to a mobile Cellular data or wifi connection',
                  btnOkOnPress: () {},
                  btnOkColor: Colors.green,
                )..show();
              }
            }),
            Divider(
              color: Colors.purple,
              thickness: 4,
            ),
            DraweList(iconsData: Icons.person_pin, title: 'ABOT US', onTap: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context)=> Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23)
                    ),
                    child: Container(
                      height: 300,
                      width: 350,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 12,
                          ),
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/nser.jpg'),
                          ),
                          const Text(
                            'Muhammad Naseer',

                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.teal,
                                fontFamily: 'd',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'FLUTTER DEVELOPER',
                            style: TextStyle(
                              color: Colors.teal,
                              fontFamily: 'b',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              letterSpacing: 2.5,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.teal.shade100,
                          ),
                          Card(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 25,
                            ),
                            child: Row(
                              children: const <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: Colors.teal,
                                ),
                                Text(
                                  '  +923453096739',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    letterSpacing: 1.5,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Card(
                            color: Colors.white,
                            margin:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.email,
                                  color: Colors.teal,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'muhammadnaseerkhan\n1122@gmail.com',
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal.shade900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  )
              );


            }),
            DraweList(iconsData: Icons.vpn_lock, title: 'WEBSITE', onTap:  () async {
              if (await CheckNet.isConnected()) {
                _launchURL3();
              } else {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.ERROR,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'No Internet Connection',
                  desc:
                  'Please Connect to a mobile Cellular data or wifi connection',
                  btnOkOnPress: () {},
                  btnOkColor: Colors.green,
                )..show();
              }
            },)
          ],
        ),
      ),
    );
  }
}


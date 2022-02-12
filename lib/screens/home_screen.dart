import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:t20_wc/screens/history_screen.dart';
import 'package:t20_wc/screens/schedule_screen.dart';
import 'package:t20_wc/screens/teams_screen.dart';
import 'package:t20_wc/screens/venue_screen.dart';
import 'package:t20_wc/utile/check_net.dart';
import 'package:t20_wc/widgets/app_drawer.dart';
import 'package:t20_wc/widgets/app_rating.dart';
import 'package:t20_wc/widgets/home_item.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _url1 = 'https://www.icc-cricket.com/live-cricket/live';
    void _launchURL() async {
      if (!await launch(_url1)) throw 'Could not launch $_url1';
    }

    String _url2 = 'https://www.icc-cricket.com/live-cricket/live';
    void _launchURL2() async {
      if (!await launch(_url2)) throw 'Could not launch $_url2';
      // show the dialog
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'T20 World Cup',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'b',
              fontSize: 23,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.star,
              size: 40,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                // set to false if you want to force a rating
                builder: (context) => AppRating(),
              );
            },
          ),
        ],
      ),
      drawer:  AppDrawer(),
      body: Stack(
        //alignment: Alignment.topRight,
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned.fill(
            child: Image.asset('assets/back.jpg',width: double.infinity,height: double.infinity,
            fit: BoxFit.cover,),

          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              children: [
                HomeItem(
                    iconData: Icons.schedule,
                    title: 'Schedule',
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ScheduleScreen();
                      }));
                    }),
                HomeItem(
                    iconData: Icons.location_on_outlined,
                    title: 'Venues',
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return VenueScreen();
                      }));
                    }),
                HomeItem(
                    iconData: Icons.history,
                    title: 'History',
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return HistoryScreen();
                      }));
                    }),
                HomeItem(
                    iconData: Icons.group,
                    title: 'Teams',
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return TeamsScreen();
                      }));
                    }),
                HomeItem(
                    iconData: Icons.live_tv,
                    title: 'Live Score',
                    onTap: () async {
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
                HomeItem(
                    iconData: Icons.video_call,
                    title: 'HighLights',
                    onTap: () async {
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
                          // btnOkIcon: Icons.subdirectory_arrow_right_rounded,
                          btnOkColor: Colors.green,
                        )..show();
                      }
                    }),
              ],
            ),
          ),



        ],
      ),
    );
  }
}

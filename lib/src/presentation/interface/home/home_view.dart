import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:xscholl/src/presentation/interface/shared/widget_background.dart';
import 'package:xscholl/src/presentation/theme/color/color_pelettes.dart';

import '../../../../assets.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return BaseBackground(
      child: SafeArea(
          child: Container(
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.white, gradient: kXschollBlueGradient),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hi Rexford",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(fontSize: 25),
                          ),
                          Text("Class XI-B  |  Roll no: 04",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                    fontSize: 20,
                                    color: kXschollWhite.withAlpha(150),
                                  )),
                          Chip(
                              label: Text(
                            '2020-2021',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 16, color: kXschollBlue),
                          )),
                        ],
                      ),
                      Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: new BoxDecoration(
                          color: const Color(0xff7c94b6),
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(50.0)),
                          border: new Border.all(
                            color: Color(0xffF2F2F2),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Image.asset('assets/images/star_pattern.png'),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 280),
              child: AnimationLimiter(
                child: GridView.count(
                  // childAspectRatio: 1.0,
                  padding: const EdgeInsets.only(top: 100.0),
                  crossAxisCount: 2,
                  children: List.generate(
                    12,
                    (int index) {
                      return AnimationConfiguration.staggeredGrid(
                        columnCount: 2,
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: ScaleAnimation(
                          scale: 0.5,
                          child: FadeInAnimation(
                            child: EmptyCard(
                              label: labels[index],
                              asset: assets[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: kXschollWhite,
              ),
            ),
            Row(
              children: [
                CustomXshullCard(
                  asset: Assets.icAttendance,
                  label: 'Attendance',
                  amount: '83.0%',
                ),
                CustomXshullCard(
                  asset: Assets.icFeesDue,
                  label: 'Fees Due',
                  amount: 'GHc500',
                ),
              ],
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
      )),
    );
  }
}

List<String> labels = [
  'Play Quiz',
  'Assigment',
  'School Holiday',
  'Time Table',
  'Result',
  'Date Sheet',
  'Ask Doubts',
  'Scholl Gallery',
  'Leave Application',
  'Chanage Password',
  'Events',
  'Logout'
];

List<String> assets = [
  Assets.icQuiz,
  Assets.icAssignment,
  Assets.icHoliday,
  Assets.icCalendra,
  Assets.icResults,
  Assets.icDateSheet,
  Assets.icDoubts,
  Assets.icGallery,
  Assets.icLeave,
  Assets.icPassword,
  Assets.icEvent,
  Assets.icLogout
];

class CustomXshullCard extends StatelessWidget {
  const CustomXshullCard({
    Key key,
    this.label,
    this.asset,
    this.amount,
  }) : super(key: key);
  final String label;
  final String asset;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      margin: EdgeInsets.only(top: 180, left: 20),
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          border: new Border.all(
            color: kXschollLightBlue,
            width: 2.0,
          ),
          color: Color(0xffF5F6FC),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(asset),
            SizedBox(
              height: 8.0,
            ),
            Text(
              amount,
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 30),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}

class EmptyCard extends StatelessWidget {
  final double width;
  final double height;
  final String label;
  final String asset;
  const EmptyCard({
    Key key,
    this.width,
    this.asset,
    this.label,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(asset),
            SizedBox(
              height: 20,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        // color: kXschollLightBlue.withAlpha(150),
        color: Color(0xffF5F6FC),

        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
    );
  }
}

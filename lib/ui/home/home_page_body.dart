import 'package:flutter/material.dart';
import 'package:hackathon2019pt2/model/planets.dart';
import 'package:hackathon2019pt2/ui/common/plannet_summary.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: new Color(0xFFFFFF),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                    (context, index) => new PlanetSummary(planets[index]),
                  childCount: planets.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

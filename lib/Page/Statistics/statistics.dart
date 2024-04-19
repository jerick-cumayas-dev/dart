import 'package:flutter/material.dart';
import 'package:fitguide_main/Components/Statistics/statistics_info.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatisticsUserInfo(),

              // Tab bar
              TabBar(
                tabs: [
                  Tab(text: 'Overview'),
                  Tab(text: 'History'),
                ],
              ),

              // Tab bar view
              Flexible(
                fit: FlexFit.loose, // Set fit to FlexFit.loose
                child: TabBarView(
                  children: [
                    // Content for Tab 1
                    Center(
                      child: Text('Tab 1 Content'),
                    ),

                    // Content for Tab 2
                    Center(
                      child: Text('Tab 2 Content'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

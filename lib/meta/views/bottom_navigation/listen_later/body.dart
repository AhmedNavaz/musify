import 'package:flutter/material.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/core/model/song.dart';
import 'package:musify/meta/utils/app_theme.dart';
import 'package:musify/meta/views/widgets/musicInfo.dart';

class ListenLaterView extends StatefulWidget {
  const ListenLaterView({Key? key}) : super(key: key);

  @override
  State<ListenLaterView> createState() => _ListenLaterViewState();
}

class _ListenLaterViewState extends State<ListenLaterView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  List<Song> song = [
    Song(
      id: "some",
      title: "Song Title",
      artist: "Artist",
      duration: "34:34",
    ),
    Song(
      id: "some",
      title: "Song Hello",
      artist: "Artist",
      duration: "6:34",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Listen Later",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 32, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xFF331D1D),
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                border: Border.all(
                  color: AppTheme.primaryColor,
                  width: 2.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: AppTheme.primaryColor,
                ),
                labelColor: Colors.black,
                unselectedLabelColor: AppTheme.primaryColor,
                tabs: const [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Playlist',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Music',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  ListView.builder(
                      itemCount: song.length,
                      itemBuilder: (context, index) {
                        return MusicInfoWidget(
                          song: song[index],
                        );
                      }),

                  // second tab bar view widget
                  ListView.builder(
                      itemCount: song.length,
                      itemBuilder: (context, index) {
                        return MusicInfoWidget(
                          song: song[index],
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musify/app/constants/assets.constant.dart';
import 'package:musify/app/constants/controller.constant.dart';
import 'package:musify/core/model/playlist.model.dart';
import 'package:musify/core/notifier/auth_provider.notifier.dart';
import 'package:musify/core/router/router_generator.dart';
import 'package:musify/meta/utils/app_theme.dart';
import 'package:provider/provider.dart';

class AddView extends StatefulWidget {
  AddView({Key? key}) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  bool isSelected = false;
  int selectedIndex = -1;

  PlaylistsModel? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Skip",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 18, color: AppTheme.primaryColor),
                  ),
                  Text(
                    "Select Playlist",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  InkWell(
                    onTap: () {
                      navigationController
                          .navigateToNamedWithArg(RouteGenerator.uploadMusic, {
                        "fromPlaylist": true,
                        "desc": selected?.description ?? "",
                        "playlistName": selected?.name ?? "",
                        "playlistFile": File(""),
                        "playlistId": selected?.playlistId ?? "",
                      });
                    },
                    child: Text(
                      "Next",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 18, color: AppTheme.primaryColor),
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Expanded(
                child: Consumer<AuthProviderNotifier>(
                    builder: (ctx, notifier, child) {
                  if (notifier.currentUser.uploads?.playlists == null) {
                    return Center(
                      child: Text(
                        "No Playlist Found",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: AppTheme.whiteColor),
                      ),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 0,
                              childAspectRatio: 1 / 1.5,
                              mainAxisSpacing: 0),
                      itemCount:
                          notifier.currentUser.uploads?.playlists?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? AppTheme.primaryColor
                                  : null,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Image.asset(
                                      Assets.splashLogo,
                                      width: 90,
                                      height: 90,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.02.sh,
                                  ),
                                  Text(
                                    "Playlist",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: selectedIndex == index
                                                ? Colors.black
                                                : AppTheme.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigationController.navigateToNamed(RouteGenerator.addPlaylist);
          },
          child: Icon(Icons.add),
        ));
  }
}

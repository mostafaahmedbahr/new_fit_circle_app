 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fit_circle_last_ui/core/colors.dart';
import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';
 import 'package:new_fit_circle_last_ui/screens/player_screens/layout_player/cubit/states.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../bottom_nav_bar_screens/player_articles/player_articles_screen.dart';
import '../../bottom_nav_bar_screens/player_chats/player_chat_screen.dart';
import '../../bottom_nav_bar_screens/player_courses/player_courses_screen.dart';
import '../../bottom_nav_bar_screens/player_home/palyer_home_screen.dart';
import '../../bottom_nav_bar_screens/player_profile/player_profile_screen.dart';


class PlayerLayoutCubit extends Cubit<PlayerLayoutStates> {
  PlayerLayoutCubit() : super(PlayerLayoutInitState());

  static PlayerLayoutCubit get(context) => BlocProvider.of(context);

  PersistentTabController controller = PersistentTabController(initialIndex: 0);


  List<Widget> buildScreens() {
    return [
      const PlayerHomeScreen(),
      const PlayerCoursesScreen(),
      const PlayerArticlesScreen(),
      const PlayerProfileScreen(),
      const PlayerChatScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: (LocaleKeys.home.tr()),
        activeColorPrimary: AppColors2.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:const Icon(Icons.fitness_center_outlined,),
        title: (LocaleKeys.exercises.tr()),
        activeColorPrimary: AppColors2.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.article,),
        title: (LocaleKeys.exercises.tr()),
        activeColorPrimary: AppColors2.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:const Icon(CupertinoIcons.person),
        title: (LocaleKeys.profile.tr()),
        activeColorPrimary: AppColors2.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:const Icon(CupertinoIcons.chat_bubble_text_fill),
        title: (LocaleKeys.chats.tr()),
        activeColorPrimary:AppColors2.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
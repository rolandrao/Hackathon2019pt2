import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackathon2019pt2/agenda/agenda_page.dart';
import 'package:hackathon2019pt2/config/index.dart';
import 'package:hackathon2019pt2/faq/faq_page.dart';
import 'package:hackathon2019pt2/find_devfest/find_devfest_page.dart';
import 'package:hackathon2019pt2/home/home_page.dart';
import 'package:hackathon2019pt2/map/map_page.dart';
import 'package:hackathon2019pt2/speakers/speaker_page.dart';
import 'package:hackathon2019pt2/sponsors/sponsor_page.dart';
import 'package:hackathon2019pt2/team/team_page.dart';
import 'package:hackathon2019pt2/utils/devfest.dart';

class ConfigPage extends StatefulWidget {
  static const String routeName = "/";
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  setupApp() {
    configBloc = ConfigBloc();
    configBloc.darkModeOn =
        Devfest.prefs.getBool(Devfest.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Google Devfest',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              //* Custom Google Font
              fontFamily: Devfest.google_sans_family,
              primarySwatch: Colors.red,
              primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  configBloc.darkModeOn ? Colors.black : Colors.grey[50],
              brightness:
                  configBloc.darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: configBloc.darkModeOn
                      ? ColorScheme.dark()
                      : ColorScheme.light()),
              appBarTheme: AppBarTheme(
                elevation: 0.0,
              ),
            ),
            home: HomePage(),
            routes: {
              HomePage.routeName: (context) => HomePage(),
              SpeakerPage.routeName: (context) => SpeakerPage(),
              AgendaPage.routeName: (context) => AgendaPage(),
              SponsorPage.routeName: (context) => SponsorPage(),
              TeamPage.routeName: (context) => TeamPage(),
              FaqPage.routeName: (context) => FaqPage(),
              FindDevFestPage.routeName: (context) => FindDevFestPage(),
              MapPage.routeName: (context) => MapPage(),
            },
          );
        },
      ),
    );
  }
}

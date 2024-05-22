import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackathon/app_state.dart';
import 'package:hackathon/constants.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class SettingsHome extends StatelessWidget {
  const SettingsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: FaIcon(
                context.watch<AppState>().currentAppBrightness ==
                        AdaptiveThemeMode.dark
                    ? FontAwesomeIcons.moon
                    : FontAwesomeIcons.sun,
                color: Theme.of(context).colorScheme.secondary),
            title: const Text('Dark mode'),
            trailing: Switch(
              value: context.watch<AppState>().currentAppBrightness ==
                  AdaptiveThemeMode.dark,
              onChanged: (value) {
                if (value) {
                  AdaptiveTheme.of(context).setDark();
                  context
                      .read<AppState>()
                      .updateAppBrightness(AdaptiveThemeMode.dark);
                } else {
                  AdaptiveTheme.of(context).setLight();
                  context
                      .read<AppState>()
                      .updateAppBrightness(AdaptiveThemeMode.light);
                }
              },
            ),
          ),
          const AppTheme(),
        ],
      ),
    );
  }
}

class AppTheme extends StatelessWidget {
  const AppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    ColorSeed currentColorSeed = context.watch<AppState>().currentColorSeed;
    return PopupMenuButton(
      onSelected: (value) {
        context.read<AppState>().updateThemeColor(context, value);
      },
      position: PopupMenuPosition.under,
      itemBuilder: (context) => List.generate(ColorSeed.values.length, (int index) {
        return CheckedPopupMenuItem(
          value: ColorSeed.values[index],
          checked: currentColorSeed == ColorSeed.values[index],
          child: Text(ColorSeed.values[index].label),
        );
      }),
      child: const ListTile(
        title: Text('App Theme'),
        leading: Icon(Icons.brightness_medium_outlined),
      ),
    );
  }
}
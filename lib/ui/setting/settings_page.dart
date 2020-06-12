import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:neucalcu/providers/color_provider.dart';
import 'package:neucalcu/themes/dimensions.dart';
import 'package:neucalcu/ui/setting/inner_ring.dart';
import 'package:neucalcu/ui/setting/neumorphic_pie.dart';
import 'package:neucalcu/ui/setting/settings_appbar.dart';
import 'package:neucalcu/util/utils.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  static const String id = '/settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    Color _selectedColor = Theme.of(context).primaryColor;
    bool _isDarkMode = context.watch<ColorProvider>().isDarkMode;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: getSystemUI(
        appTheme: _isDarkMode,
        navBarColor: _theme.primaryColorDark,
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(sizeBody1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SettingsAppbar(),
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleContainer(),
                      CircleColorPicker(
                        initialColor: _selectedColor,
                        thumbSize: 40.0,
                        strokeWidth: 12.0,
                        size: Size(255, 255),
                        onChanged: (color) {
                          var provider = context.read<ColorProvider>();
                          setState(() {
                            provider.updatePrimaryColor(color);
                            return _selectedColor = color;
                          });
                        },
                        colorCodeBuilder: (context, color) {
                          return Text(
                            ' ',
                            style: TextStyle(fontSize: 24.0),
                          );
                        },
                      ),
                      InnerRing(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
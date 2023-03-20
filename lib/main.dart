import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Localization Example',

      // Delegates.
      localizationsDelegates: const [
        // Added after generating l10n files.
        // 💡 run flutter gen-l10n to create the required files.
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Supported locales.
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
      ],
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.calendar_month),
        onPressed: () {
          // Open the calendar with english locale.
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            context: context,
            builder: (_) {
              return Localizations.override(
                context: context,
                locale: const Locale('es'),
                // Using builder to get the correct context.
                child: Builder(builder: (context) {
                  return Column(
                    children: [
                      Text(AppLocalizations.of(context)!.welcome("John")),
                      const SizedBox(height: 10),
                      Material(
                        color: Colors.transparent,
                        child: CalendarDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime(3000),
                          onDateChanged: (value) {
                            // Placeholder.
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  );
                }),
              );
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.welcome('John'),
        ),
      ),
      body: SafeArea(child: Container()),
    );
  }
}

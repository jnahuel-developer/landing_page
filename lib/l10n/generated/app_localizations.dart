import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('it'),
  ];

  /// No description provided for @headerTitle.
  ///
  /// In es, this message translates to:
  /// **'Nahuel Martínez - Desarrollador'**
  String get headerTitle;

  /// No description provided for @login.
  ///
  /// In es, this message translates to:
  /// **'Loguearse'**
  String get login;

  /// No description provided for @services.
  ///
  /// In es, this message translates to:
  /// **'Servicios'**
  String get services;

  /// No description provided for @contact.
  ///
  /// In es, this message translates to:
  /// **'Contacto'**
  String get contact;

  /// No description provided for @aboutTitle.
  ///
  /// In es, this message translates to:
  /// **'Sobre mí'**
  String get aboutTitle;

  /// No description provided for @aboutDescription.
  ///
  /// In es, this message translates to:
  /// **'Soy Ingeniero Electrónico con más de siete años de experiencia en el desarrollo de software, firmware y aplicaciones, con trayectoria en sectores altamente exigentes como la industria médica y la financiera. Mi formación técnica, sumada a la experiencia práctica en entornos regulados, me permite abordar proyectos complejos con una visión integral: desde la concepción inicial hasta la implementación final, asegurando calidad, eficiencia y cumplimiento normativo.\n\nA lo largo de mi carrera he participado en proyectos de alto impacto, entre ellos la creación y puesta en el mercado de dispositivos médicos certificados y el desarrollo de soluciones de software críticas para sistemas financieros. Estos proyectos no solo exigieron un dominio profundo de lenguajes de programación como C, C++ y C#, sino también la capacidad de gestionar calidad bajo normas internacionales como ISO 13485. Gracias a estas experiencias he logrado resultados concretos, como la reducción de costos productivos, la optimización de procesos de control de calidad y la implementación de soluciones robustas y seguras en entornos de producción.\n\nEn mi rol actual como desarrollador freelance, me especializo en el diseño y construcción de aplicaciones móviles multiplataforma utilizando Flutter, con integraciones en Firebase, APIs externas y servicios en la nube. Mi objetivo es entregar aplicaciones escalables, seguras y orientadas al usuario final, que aporten valor real a las organizaciones. La experiencia adquirida en la industria me permite traducir necesidades de negocio en soluciones tecnológicas viables, equilibrando innovación, calidad y eficiencia.'**
  String get aboutDescription;

  /// No description provided for @aboutLinkedin.
  ///
  /// In es, this message translates to:
  /// **'LinkedIn'**
  String get aboutLinkedin;

  /// No description provided for @aboutGithub.
  ///
  /// In es, this message translates to:
  /// **'GitHub'**
  String get aboutGithub;

  /// No description provided for @aboutPhone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono'**
  String get aboutPhone;

  /// No description provided for @aboutEmail.
  ///
  /// In es, this message translates to:
  /// **'Mail'**
  String get aboutEmail;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

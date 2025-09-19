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

  /// No description provided for @aboutTitle.
  ///
  /// In es, this message translates to:
  /// **'Sobre mí'**
  String get aboutTitle;

  /// No description provided for @aboutDescription.
  ///
  /// In es, this message translates to:
  /// **'👋 Hola, soy @jnahuel-developer\n\nSoy Ingeniero Electrónico con amplia experiencia en diseño de software y hardware. Me gradué en la UTN-BA en 2017, y desde entonces acumulo más de seis años trabajando en proyectos de ingeniería diversos.\n\n🚀 Sobre mí\n\n🔹 Experiencia en sistemas ISO: he diseñado sistemas cumpliendo normas ISO 13485 (dispositivos médicos) e ISO 8583 (transacciones financieras).\n\n🔹 Optimización de costos y fabricación: lideré iniciativas para reducir costos de producción, reemplazando componentes obsoletos y estableciendo nuevos proveedores de PCBs en China, mejorando eficiencia y calidad.\n\n💻 Desarrollo de software\n\nDominio de C.\nConocimientos avanzados de C++, C# y MATLAB.\nConocimientos básicos de Python, HTML, CSS y JavaScript.\nExperiencia con bases de datos relacionales como MySQL.\nDesarrollo de apps móviles multiplataforma con Flutter, integrando Firebase y Dropbox API.\n\n🔩 Diseño de hardware\n\nExperiencia con Altium Designer para diseño de PCBs.\nDesarrollo de librerías personalizadas: integración de modelos 3D y referencias actualizadas de componentes.\nModelado 3D de PCBs completas: facilitando interacción con equipos de mecánica.\nGestión de listas de materiales (BOM): actualizando BOMs para asistir al área de compras.\n\n🎯 Intereses\n\nMe apasionan tanto los desafíos de hardware como de software. Disfruto resolver problemas complejos, desde firmware hasta aplicaciones full-stack.\n\n🌱 Actualmente aprendiendo\n\nEstoy expandiendo mis habilidades, enfocándome en:\n\nDesarrollo avanzado con Flutter.\nDocker para orquestación de entornos.\nKubernetes (meta futura) para mejorar despliegues en producción y escalabilidad.'**
  String get aboutDescription;

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

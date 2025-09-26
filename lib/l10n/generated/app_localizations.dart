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

  /// No description provided for @languageSpanish.
  ///
  /// In es, this message translates to:
  /// **'🇦🇷 Español'**
  String get languageSpanish;

  /// No description provided for @languageEnglish.
  ///
  /// In es, this message translates to:
  /// **'🇺🇸 English'**
  String get languageEnglish;

  /// No description provided for @languageItalian.
  ///
  /// In es, this message translates to:
  /// **'🇮🇹 Italiano'**
  String get languageItalian;

  /// No description provided for @heroMain.
  ///
  /// In es, this message translates to:
  /// **'Ingeniero Electrónico & Desarrollador Freelance'**
  String get heroMain;

  /// No description provided for @heroExpanded.
  ///
  /// In es, this message translates to:
  /// **'Software • Hardware • Android • Web • Investigación • Optimización de procesos'**
  String get heroExpanded;

  /// No description provided for @aboutTitle.
  ///
  /// In es, this message translates to:
  /// **'Sobre mí'**
  String get aboutTitle;

  /// No description provided for @aboutShowMore.
  ///
  /// In es, this message translates to:
  /// **'Conocer más'**
  String get aboutShowMore;

  /// No description provided for @aboutShortDescription.
  ///
  /// In es, this message translates to:
  /// **'Soy Ingeniero Electrónico con más de siete años de experiencia en el desarrollo de software y productos, habiendo trabajado en industrias altamente exigentes en el cumplimiento de normativas de calidad y diseño ISO. Hoy ofrezco servicios de desarrollo freelance, diseñando y creando soluciones digitales a tu medida: aplicaciones, sitios web y sistemas de gestión que integran servicios en la nube y APIs, para que tengas exactamente lo que tu proyecto necesita.'**
  String get aboutShortDescription;

  /// No description provided for @aboutDescription.
  ///
  /// In es, this message translates to:
  /// **' Soy Ingeniero Electrónico con más de siete años de experiencia en el desarrollo de software, firmware y aplicaciones, con trayectoria en sectores altamente exigentes como la industria médica y la financiera. Mi formación técnica, sumada a la experiencia práctica en entornos regulados, me permite abordar proyectos complejos con una visión integral: desde la concepción inicial hasta la implementación final, asegurando calidad, eficiencia y cumplimiento normativo.\n\nA lo largo de mi carrera he participado en proyectos de alto impacto, entre ellos la creación y puesta en el mercado de dispositivos médicos certificados y el desarrollo de soluciones de software críticas para sistemas financieros. Estos proyectos no solo exigieron un dominio profundo de lenguajes de programación, sino también la capacidad de gestionar calidad bajo normas internacionales como ISO 13485. Gracias a estas experiencias he logrado resultados concretos, como la reducción de costos productivos, la optimización de procesos de control de calidad y la implementación de soluciones robustas y seguras en entornos de producción.\n\nEn mi rol actual como desarrollador freelance, me especializo en el diseño y construcción de aplicaciones móviles multiplataforma utilizando Flutter, con integraciones en Firebase, APIs externas y servicios en la nube. Mi objetivo es entregar aplicaciones escalables, seguras y orientadas al usuario final, que aporten valor real a las organizaciones. La experiencia adquirida en la industria me permite traducir necesidades de negocio en soluciones tecnológicas viables, equilibrando innovación, calidad y eficiencia.'**
  String get aboutDescription;

  /// No description provided for @aboutLinkedin.
  ///
  /// In es, this message translates to:
  /// **'Carrera'**
  String get aboutLinkedin;

  /// No description provided for @aboutGithub.
  ///
  /// In es, this message translates to:
  /// **'Proyectos'**
  String get aboutGithub;

  /// No description provided for @aboutPhone.
  ///
  /// In es, this message translates to:
  /// **'Hablemos'**
  String get aboutPhone;

  /// No description provided for @aboutEmail.
  ///
  /// In es, this message translates to:
  /// **'Contacto'**
  String get aboutEmail;

  /// No description provided for @aboutPresentation.
  ///
  /// In es, this message translates to:
  /// **'Ver presentación'**
  String get aboutPresentation;

  /// No description provided for @servicesSectionTitle.
  ///
  /// In es, this message translates to:
  /// **'Servicios'**
  String get servicesSectionTitle;

  /// No description provided for @serviceAndroidTitle.
  ///
  /// In es, this message translates to:
  /// **'Aplicaciones móviles'**
  String get serviceAndroidTitle;

  /// No description provided for @serviceWebTitle.
  ///
  /// In es, this message translates to:
  /// **'Desarrollo Web'**
  String get serviceWebTitle;

  /// No description provided for @serviceDesktopTitle.
  ///
  /// In es, this message translates to:
  /// **'Aplicaciones de escritorio'**
  String get serviceDesktopTitle;

  /// No description provided for @serviceChatbotTitle.
  ///
  /// In es, this message translates to:
  /// **'Chatbots / Asistencia virtual'**
  String get serviceChatbotTitle;

  /// No description provided for @serviceIATitle.
  ///
  /// In es, this message translates to:
  /// **'Aplicaciones de IA'**
  String get serviceIATitle;

  /// No description provided for @serviceSqlTitle.
  ///
  /// In es, this message translates to:
  /// **'Bases de datos'**
  String get serviceSqlTitle;

  /// No description provided for @serviceProductTitle.
  ///
  /// In es, this message translates to:
  /// **'Producto'**
  String get serviceProductTitle;

  /// No description provided for @servicePcbTitle.
  ///
  /// In es, this message translates to:
  /// **'PCB'**
  String get servicePcbTitle;

  /// No description provided for @servicePrototypeTitle.
  ///
  /// In es, this message translates to:
  /// **'Prototipado'**
  String get servicePrototypeTitle;

  /// No description provided for @serviceOptimizationTitle.
  ///
  /// In es, this message translates to:
  /// **'Optimización de procesos'**
  String get serviceOptimizationTitle;

  /// No description provided for @serviceIotTitle.
  ///
  /// In es, this message translates to:
  /// **'IoT'**
  String get serviceIotTitle;

  /// No description provided for @serviceIosTitle.
  ///
  /// In es, this message translates to:
  /// **'iOS'**
  String get serviceIosTitle;

  /// No description provided for @serviceAndroidDescription.
  ///
  /// In es, this message translates to:
  /// **'Desarrollo de aplicaciones Android modernas y fáciles de usar, pensadas para ofrecer la mejor experiencia a tus clientes e integradas con servicios en la nube y APIs.'**
  String get serviceAndroidDescription;

  /// No description provided for @serviceWebDescription.
  ///
  /// In es, this message translates to:
  /// **'Diseño y desarrollo de sitios y aplicaciones web escalables, adaptadas a cualquier dispositivo y enfocadas en el rendimiento y la experiencia del usuario.'**
  String get serviceWebDescription;

  /// No description provided for @serviceDesktopDescription.
  ///
  /// In es, this message translates to:
  /// **'Desarrollo de software a medida para entornos Windows, con interfaces gráficas intuitivas, comunicación con periféricos y gestión eficiente de bases de datos.'**
  String get serviceDesktopDescription;

  /// No description provided for @serviceChatbotDescription.
  ///
  /// In es, this message translates to:
  /// **'Automatiza la atención al cliente con chatbots inteligentes y asistentes virtuales capaces de brindar respuestas rápidas, personalizadas y disponibles las 24 horas.'**
  String get serviceChatbotDescription;

  /// No description provided for @serviceIADescription.
  ///
  /// In es, this message translates to:
  /// **'Implementación de soluciones basadas en inteligencia artificial: análisis de datos, reconocimiento de patrones y sistemas predictivos para potenciar tu negocio.'**
  String get serviceIADescription;

  /// No description provided for @serviceSqlDescription.
  ///
  /// In es, this message translates to:
  /// **'Creación y gestión de bases de datos SQL optimizadas, asegurando la estabilidad, seguridad y escalabilidad de tus aplicaciones y sistemas.'**
  String get serviceSqlDescription;

  /// No description provided for @serviceProductDescription.
  ///
  /// In es, this message translates to:
  /// **'Acompañamiento integral en el desarrollo de productos tecnológicos, desde la idea inicial hasta una solución lista para el mercado.'**
  String get serviceProductDescription;

  /// No description provided for @servicePcbDescription.
  ///
  /// In es, this message translates to:
  /// **'Diseño de esquemáticos y placas electrónicas (PCB) con foco en la eficiencia y la reducción de costos productivos, cumpliendo altos estándares de calidad.'**
  String get servicePcbDescription;

  /// No description provided for @servicePrototypeDescription.
  ///
  /// In es, this message translates to:
  /// **'Desarrollo de prototipos electrónicos funcionales para validar ideas, acelerar pruebas y facilitar la evolución hacia productos finales.'**
  String get servicePrototypeDescription;

  /// No description provided for @serviceOptimizationDescription.
  ///
  /// In es, this message translates to:
  /// **'Análisis y optimización de procesos productivos y de software, reduciendo costos y mejorando tiempos de entrega sin sacrificar calidad.'**
  String get serviceOptimizationDescription;

  /// No description provided for @serviceIotDescription.
  ///
  /// In es, this message translates to:
  /// **'Soluciones de Internet of Things que integran hardware y software, conectando dispositivos para generar datos y crear nuevas oportunidades de negocio.'**
  String get serviceIotDescription;

  /// No description provided for @serviceIosDescription.
  ///
  /// In es, this message translates to:
  /// **'Desarrollo de aplicaciones para iOS con una experiencia fluida y confiable, integradas con servicios en la nube y adaptadas a las necesidades de tus usuarios.'**
  String get serviceIosDescription;

  /// No description provided for @serviceAndroidSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Apps Android modernas y seguras, hechas a tu medida.'**
  String get serviceAndroidSubtitle;

  /// No description provided for @serviceWebSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Aplicaciones web rápidas, atractivas y accesibles desde cualquier dispositivo.'**
  String get serviceWebSubtitle;

  /// No description provided for @serviceDesktopSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Software de escritorio confiable para tu entorno Windows.'**
  String get serviceDesktopSubtitle;

  /// No description provided for @serviceChatbotSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Chatbots inteligentes que atienden a tus clientes 24/7.'**
  String get serviceChatbotSubtitle;

  /// No description provided for @serviceIASubtitle.
  ///
  /// In es, this message translates to:
  /// **'Soluciones de IA que llevan tu negocio al siguiente nivel.'**
  String get serviceIASubtitle;

  /// No description provided for @serviceSqlSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Bases de datos confiables para que tu información esté siempre segura.'**
  String get serviceSqlSubtitle;

  /// No description provided for @serviceProductSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Convertí tus ideas en productos tecnológicos listos para el mercado.'**
  String get serviceProductSubtitle;

  /// No description provided for @servicePcbSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Placas electrónicas diseñadas para calidad, funcionalidad y bajo costo.'**
  String get servicePcbSubtitle;

  /// No description provided for @servicePrototypeSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Prototipos electrónicos para validar tu idea en tiempo récord.'**
  String get servicePrototypeSubtitle;

  /// No description provided for @serviceOptimizationSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Procesos más ágiles, eficientes y sostenibles para tu negocio.'**
  String get serviceOptimizationSubtitle;

  /// No description provided for @serviceIotSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Dispositivos conectados que transforman datos en oportunidades.'**
  String get serviceIotSubtitle;

  /// No description provided for @serviceIosSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Apps iOS fluidas, seguras y con la mejor experiencia de usuario.'**
  String get serviceIosSubtitle;

  /// No description provided for @serviceAndroidLongDescription.
  ///
  /// In es, this message translates to:
  /// **'Desarrollo de aplicaciones Android personalizadas, diseñadas para adaptarse a las necesidades específicas de tu negocio o proyecto. Creo soluciones intuitivas y modernas que mejoran la experiencia del usuario, integrando servicios en la nube, notificaciones, sistemas de autenticación y sincronización de datos en tiempo real. Mis desarrollos buscan siempre ser escalables, seguros y fáciles de mantener, para que tu inversión rinda a largo plazo.'**
  String get serviceAndroidLongDescription;

  /// No description provided for @serviceWebLongDescription.
  ///
  /// In es, this message translates to:
  /// **'Diseño y desarrollo de aplicaciones web modernas, accesibles desde cualquier dispositivo y pensadas para ofrecer la mejor experiencia al usuario. Construyo sitios y sistemas con interfaces atractivas y rápidas, que se adaptan a las necesidades de tu negocio, ya sea para brindar información, gestionar procesos internos o crear plataformas interactivas para tus clientes. Cada desarrollo está pensado para crecer en el tiempo, integrándose con bases de datos, servicios en la nube y APIs externas.'**
  String get serviceWebLongDescription;

  /// No description provided for @serviceDesktopLongDescription.
  ///
  /// In es, this message translates to:
  /// **'Desarrollo de aplicaciones de escritorio para entornos Windows, diseñadas para brindar soluciones confiables y eficientes en la gestión de procesos y datos. Mis aplicaciones cuentan con interfaces gráficas intuitivas, conexión con bases de datos y compatibilidad con periféricos, logrando un software que se adapta a las necesidades específicas de tu negocio. El objetivo es ofrecer herramientas robustas, fáciles de usar y sostenibles a largo plazo.'**
  String get serviceDesktopLongDescription;

  /// No description provided for @serviceChatbotLongDescription.
  ///
  /// In es, this message translates to:
  /// **'Implementación de chatbots y asistentes virtuales que permiten mejorar la atención al cliente, automatizar respuestas frecuentes y optimizar la comunicación con los usuarios. Mis soluciones de chatbot se integran en sitios web, aplicaciones y plataformas de mensajería, ofreciendo soporte 24/7 de manera clara y personalizada. Esto ayuda a reducir tiempos de espera, mejorar la experiencia de los clientes y potenciar la productividad de tu negocio.'**
  String get serviceChatbotLongDescription;

  /// No description provided for @serviceIALongDescription.
  ///
  /// In es, this message translates to:
  /// **'Desarrollo de soluciones basadas en Inteligencia Artificial que permiten automatizar procesos, analizar grandes volúmenes de datos y generar predicciones útiles para la toma de decisiones. Mis aplicaciones de IA se adaptan a distintos rubros, desde el reconocimiento de imágenes hasta la recomendación de contenidos, con foco en aportar valor real a tu negocio. La meta es ayudarte a innovar y mantenerte competitivo en un entorno digital en constante evolución.'**
  String get serviceIALongDescription;

  /// No description provided for @serviceSqlLongDescription.
  ///
  /// In es, this message translates to:
  /// **'Diseño y administración de bases de datos SQL robustas, que aseguran el manejo eficiente, seguro y confiable de la información crítica de tu negocio. Cada base de datos se estructura pensando en la escalabilidad y en la velocidad de acceso, garantizando la estabilidad de las aplicaciones que la utilizan. Además, implemento buenas prácticas de seguridad y respaldo, para que tus datos estén siempre protegidos.'**
  String get serviceSqlLongDescription;

  /// No description provided for @serviceProductLongDescription.
  ///
  /// In es, this message translates to:
  /// **'Acompaño el desarrollo completo de productos tecnológicos, desde la idea inicial hasta la puesta en marcha. Esto incluye la planificación, diseño y ejecución de cada etapa, buscando que el resultado final no solo cumpla con tus expectativas, sino que también se adapte a estándares de calidad y eficiencia productiva. Trabajo junto a vos para convertir una idea en un producto real, optimizando costos y reduciendo riesgos en el camino.'**
  String get serviceProductLongDescription;

  /// No description provided for @servicePcbLongDescription.
  ///
  /// In es, this message translates to:
  /// **'Diseño de circuitos impresos (PCB) y esquemáticos electrónicos optimizados para garantizar la mejor relación entre calidad, funcionalidad y costos de producción. Cada diseño se realiza teniendo en cuenta normativas de calidad, compatibilidad de componentes y facilidad de montaje, reduciendo riesgos y mejorando la eficiencia en la fabricación. Mi objetivo es ayudarte a transformar tus ideas en placas electrónicas listas para la producción, confiables y sostenibles en el tiempo.'**
  String get servicePcbLongDescription;

  /// No description provided for @servicePrototypeLongDescription.
  ///
  /// In es, this message translates to:
  /// **'Desarrollo de prototipos electrónicos que permiten validar rápidamente una idea antes de llevarla a la producción en serie. El prototipado es clave para probar funcionalidades, detectar mejoras y reducir costos futuros, asegurando que el producto final cumpla con los objetivos propuestos. Trabajo en estrecha colaboración para que tu proyecto pase de concepto a prototipo funcional en el menor tiempo posible.'**
  String get servicePrototypeLongDescription;

  /// No description provided for @serviceOptimizationLongDescription.
  ///
  /// In es, this message translates to:
  /// **'Análisis y mejora de procesos productivos y de software con el fin de aumentar la eficiencia, reducir costos y mejorar la calidad. Mi experiencia en industrias reguladas me permite detectar cuellos de botella, proponer soluciones prácticas y aplicar estándares de calidad que impactan directamente en la productividad. El objetivo es que tus procesos sean más ágiles, confiables y sostenibles en el tiempo.'**
  String get serviceOptimizationLongDescription;

  /// No description provided for @serviceIotLongDescription.
  ///
  /// In es, this message translates to:
  /// **'Desarrollo de soluciones de Internet of Things que conectan dispositivos físicos con plataformas digitales, generando información valiosa y nuevas oportunidades de negocio. Integro hardware y software en sistemas conectados, con foco en la recolección de datos, la comunicación en tiempo real y la facilidad de uso. Esto te permite monitorear, automatizar y escalar tus proyectos de manera eficiente y confiable.'**
  String get serviceIotLongDescription;

  /// No description provided for @serviceIosLongDescription.
  ///
  /// In es, this message translates to:
  /// **'Desarrollo de aplicaciones para iOS con interfaces modernas y fluidas, pensadas para brindar una experiencia confiable a los usuarios de iPhone y iPad. Mis desarrollos contemplan la integración de servicios en la nube, sincronización de datos y conexión con APIs, asegurando que tu aplicación sea completa, segura y escalable. El objetivo es crear apps que no solo funcionen bien, sino que generen valor real para tu negocio o emprendimiento.'**
  String get serviceIosLongDescription;

  /// No description provided for @serviceAndroidExamples.
  ///
  /// In es, this message translates to:
  /// **'• App para gestión de clientes\n• App para gestión de turnos\n• App para gestión de stock\n• App para almacenamiento de fotos, videos y archivos importantes'**
  String get serviceAndroidExamples;

  /// No description provided for @serviceWebExamples.
  ///
  /// In es, this message translates to:
  /// **'• Plataforma de reservas online\n• Portal de clientes con login y área privada\n• Sistema de gestión de pedidos\n• Sitio institucional con panel de administración'**
  String get serviceWebExamples;

  /// No description provided for @serviceDesktopExamples.
  ///
  /// In es, this message translates to:
  /// **'• Sistema de gestión comercial\n• Aplicación de control de inventario\n• Software para conexión con impresoras y escáneres\n• Herramientas administrativas con reportes avanzados'**
  String get serviceDesktopExamples;

  /// No description provided for @serviceChatbotExamples.
  ///
  /// In es, this message translates to:
  /// **'• Chatbot para atención al cliente en sitios web\n• Asistente virtual en WhatsApp\n• Respuestas automáticas en redes sociales\n• Sistema de soporte para ecommerce'**
  String get serviceChatbotExamples;

  /// No description provided for @serviceIAExamples.
  ///
  /// In es, this message translates to:
  /// **'• Modelo de predicción de ventas\n• Sistema de recomendación de productos\n• Análisis automático de encuestas o comentarios\n• Reconocimiento de imágenes y patrones'**
  String get serviceIAExamples;

  /// No description provided for @serviceSqlExamples.
  ///
  /// In es, this message translates to:
  /// **'• Base de datos para gestión de usuarios y clientes\n• Base de datos para inventarios y stock\n• Registro de transacciones financieras\n• Sistemas de reportes personalizados'**
  String get serviceSqlExamples;

  /// No description provided for @serviceProductExamples.
  ///
  /// In es, this message translates to:
  /// **'• Desarrollo de un dispositivo electrónico portátil\n• Creación de un producto de consumo con conectividad IoT\n• Equipos médicos bajo normativas de calidad\n• Sistemas de automatización para pymes'**
  String get serviceProductExamples;

  /// No description provided for @servicePcbExamples.
  ///
  /// In es, this message translates to:
  /// **'• Diseño de PCB para equipos médicos\n• PCB para dispositivos de consumo masivo\n• Placas para sistemas de control industrial\n• Optimización de diseños para reducir costos de fabricación'**
  String get servicePcbExamples;

  /// No description provided for @servicePrototypeExamples.
  ///
  /// In es, this message translates to:
  /// **'• Prototipo de un dispositivo IoT con sensores\n• Prototipo de una aplicación integrada con hardware\n• Validación temprana de un producto electrónico\n• Prototipos para presentaciones a inversores o ferias'**
  String get servicePrototypeExamples;

  /// No description provided for @serviceOptimizationExamples.
  ///
  /// In es, this message translates to:
  /// **'• Reducción de costos en la producción de electrónica\n• Optimización de tiempos de calibración y control\n• Estandarización de procesos de software\n• Mejora en la trazabilidad de productos'**
  String get serviceOptimizationExamples;

  /// No description provided for @serviceIotExamples.
  ///
  /// In es, this message translates to:
  /// **'• Sistema de monitoreo remoto de sensores\n• Control de dispositivos industriales desde una app\n• Soluciones de domótica para hogares y oficinas\n• Dispositivos conectados con almacenamiento en la nube'**
  String get serviceIotExamples;

  /// No description provided for @serviceIosExamples.
  ///
  /// In es, this message translates to:
  /// **'• App para reservas y turnos en iPhone\n• App de gestión empresarial para iPad\n• Aplicación de almacenamiento en la nube\n• Soluciones personalizadas para startups y pymes'**
  String get serviceIosExamples;

  /// No description provided for @titleExamples.
  ///
  /// In es, this message translates to:
  /// **'Ejemplos'**
  String get titleExamples;

  /// No description provided for @flipCardFalseKnowMore.
  ///
  /// In es, this message translates to:
  /// **'Conocer más...'**
  String get flipCardFalseKnowMore;

  /// No description provided for @flipCardTrueKnowMore.
  ///
  /// In es, this message translates to:
  /// **'Conocer aún más...'**
  String get flipCardTrueKnowMore;

  /// No description provided for @flipCardPopupClose.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get flipCardPopupClose;

  /// No description provided for @contactTitle.
  ///
  /// In es, this message translates to:
  /// **'Contacto'**
  String get contactTitle;

  /// No description provided for @contactName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get contactName;

  /// No description provided for @contactEmail.
  ///
  /// In es, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// No description provided for @contactMessage.
  ///
  /// In es, this message translates to:
  /// **'Mensaje'**
  String get contactMessage;

  /// No description provided for @contactSend.
  ///
  /// In es, this message translates to:
  /// **'Enviar'**
  String get contactSend;

  /// No description provided for @contactSentSuccess.
  ///
  /// In es, this message translates to:
  /// **'Mensaje enviado correctamente. ¡Gracias!'**
  String get contactSentSuccess;

  /// No description provided for @contactSentError.
  ///
  /// In es, this message translates to:
  /// **'Error al enviar el mensaje. Intentá nuevamente.'**
  String get contactSentError;
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

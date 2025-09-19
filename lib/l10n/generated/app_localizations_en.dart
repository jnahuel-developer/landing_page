// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get aboutTitle => 'About Me';

  @override
  String get aboutDescription =>
      '👋 Hi, I’m @jnahuel-developer\n\nI am an Electronic Engineer with a strong background in both software and hardware design. I graduated from UTN-BA in 2017, and since then, I have accumulated over six years of experience working on diverse engineering projects.\n\n🚀 About Me\n\n🔹 Expertise in ISO-compliant systems: I have designed systems following ISO 13485 (medical devices) and ISO 8583 (financial transactions).\n\n🔹 Cost Optimization & Manufacturing: I have led initiatives to reduce production costs, replacing obsolete components and establishing new PCB suppliers in China, improving efficiency and product quality.\n\n💻 Software Development\n\nProficient in C.\nAdvanced knowledge of C++, C#, and MATLAB.\nBasic knowledge of Python, HTML, CSS, and JavaScript.\nExperience working with relational databases like MySQL.\nDevelopment of scalable cross-platform mobile apps using Flutter, integrating Firebase (database) and Dropbox API (secure file synchronization).\n\n🔩 Hardware Design\n\nExperience with Altium Designer for PCB design.\nCustom library development: Integration of 3D models and updated component references for seamless procurement.\n3D modeling of complete PCBs: Facilitating interaction and analysis with mechanical engineering teams.\nBOM (Bill of Materials) management: Keeping BOMs updated to assist the purchasing department.\n\n🎯 Interests\n\nI am passionate about both hardware and software challenges. I enjoy tackling complex engineering problems, whether they involve firmware development, embedded systems, or full-stack applications.\n\n🌱 Currently Learning\n\nI am constantly expanding my skills, currently focusing on:\n\nAdvanced Flutter development for enhanced cross-platform mobile applications.\nDocker for environment orchestration, enabling isolated modules and dependency management.\nKubernetes (future goal) to streamline production deployments and improve scalability.';

  @override
  String get headerTitle => 'Nahuel Martínez - Developer';

  @override
  String get login => 'Login';

  @override
  String get services => 'Services';

  @override
  String get contact => 'Contact';
}

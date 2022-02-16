import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/providers/init_provider.dart';
import 'package:instagram_clone/providers/theme_provider.dart';
import 'package:instagram_clone/screens/auth_screen.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue firebaseInit = ref.watch(firebaseInitProvider);
    final darkModeEnabled = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
      },
      themeMode: darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: firebaseInit.when(
        data: (data) {
          return const AuthScreen();
        },
        error: (e, err) {
          return Center(
            child: Text(e.toString() + "\n" + err.toString()),
          );
        },
        loading: () {
          return const Center(
              child: CircularProgressIndicator(
            color: primaryColor,
          ));
        },
      ),
    );
  }
}

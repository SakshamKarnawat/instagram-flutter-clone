import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/providers/init_provider.dart';
import 'package:instagram_clone/providers/navbar_provider.dart';
import 'package:instagram_clone/providers/pageview_camerafeedchat_provider.dart';
import 'package:instagram_clone/providers/reels_provider.dart';
import 'package:instagram_clone/providers/theme_provider.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/auth_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart' as pro;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseInit = ref.watch(firebaseInitProvider);
    return pro.MultiProvider(
      providers: [
        pro.ChangeNotifierProvider(create: (_) => ThemeProvider()),
        pro.ChangeNotifierProvider(create: (_) => ReelsProvider()),
        pro.ChangeNotifierProvider(create: (_) => NavBarProvider()),
        pro.ChangeNotifierProvider(create: (_) => PageViewProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Clone',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: firebaseInit.when(
          data: (data) {
            return const ResponsiveLayout(
              webScreenLayout: WebScreenLayout(),
              mobileScreenLayout: AuthScreen(),
            );
          },
          error: (e, err) {
            return Center(
              child: Text(e.toString() + "     " + err.toString()),
            );
          },
          loading: () {
            return const Center(
                child: CircularProgressIndicator(
              color: primaryColor,
            ));
          },
        ),

        /* StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  webScreenLayout: WebScreenLayout(),
                  mobileScreenLayout: MobileScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
              ));
            }
            return const LoginScreen();
          },
        ), */
        /* const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ), */
      ),
    );
  }
}
